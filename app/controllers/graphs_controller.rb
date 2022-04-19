class GraphsController < ApplicationController
  
  def index
    @posts = Post.all
    @posts = Post.where(user_id: current_user.id)
    
    # 評価比較
    @maru = @posts.where(today_mood: "◯")
    @sankaku = @posts.where(today_mood: "△")
    @batu = @posts.where(today_mood: "×")
    
    # グラフ
    @day_list = {}.tap do |result|
      @posts.each do |post|
        # 今日の日付と値に対する処理
        # 投稿が一致するものを複数から探す
        result[post.created_at.to_date] = case post.today_mood
                                  when '○'
                                    3
                                  when '△'
                                    2
                                  when '×'
                                    1
                                  end
      end
    end
    # 今月を取得し月を表示
    @month = Date.today
    
    # パラメーターでdate月を取得した時の処理
    @month_days =  if params[:date]
                    # 表示月は今月の前月にする
                     @month = Date.today
                    # 月初と月末まで parseで日付をオブジェクトに変換
                     (Date.today.beginning_of_month..Date.today.end_of_month).to_a
                   else
                     @month = Date.today.next_month
                      # 月データ範囲 月初から月末 配列に変換
                     (Date.today.beginning_of_month..Date.today.end_of_month).to_a
                   end
    
    # 
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
