class GraphsController < ApplicationController
  
  def index
    @posts = Post.all
    @posts = Post.where(user_id: current_user.id)
    
    # グラフ
    @day_list = {}.tap do |result|
      @posts.each do |post|
        # 今日の日付と値に対する処理
        Rails.logger.debug post.today_mood
        # 投稿が一致するものを複数から探す
        result[post.created_at.to_date] = case post.today_mood
                                  when '◯'
                                    3
                                  when '△'
                                    2
                                  when '×'
                                    1
                                  end
      end
    end
    Rails.logger.debug @day_list
    # パラメーターでdate月を取得した時の処理
    @month_days =  if params[:date].present?
    # 次の月・前の月　date を Date._parseでTimeオブジェクトに変換
      @month = Time.parse(params[:date] + "01")
    # 配列に変換し月の日付を取得
      (@month.beginning_of_month.to_datetime..@month.end_of_month.to_datetime).to_a
    else
      # 当月
      @month = Time.current.to_date
      (@month.beginning_of_month.to_datetime..@month.end_of_month.to_datetime).to_a
    end
    
    # 評価比較　当月の始まりと終わりを入れて当月のみ取得
    @maru = @posts.where(today_mood: "◯", created_at: @month.beginning_of_month..@month.end_of_month)
    @sankaku = @posts.where(today_mood: "△", created_at: @month.beginning_of_month..@month.end_of_month)
    @batu = @posts.where(today_mood: "×", created_at: @month.beginning_of_month..@month.end_of_month)
    
    
    @post_by_day = {}.tap do |result|
      @month_days.each do |d|
        result[d] = @day_list[d] ? @day_list[d] : 0
      end
    end
    
    # 日付のラベル　javascriptの変数として渡す
    @chartlabels = @post_by_day.map(&:first).to_json.html_safe
    @chartdatas = @post_by_day.map(&:second)
    
     # 折線グラフ
    @cumulative = []
    sum=0
    @chartdatas.each do |a|
      sum = sum + a
      @cumulative<<sum
    end
  end
end
