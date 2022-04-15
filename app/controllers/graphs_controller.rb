class GraphsController < ApplicationController
  
  def index
    @posts = Post.all
    @posts = Post.where(user_id: current_user.id)
    # その月のみ表示の為にはその月の投稿を抽出
    @month = Date.today.month
    # 評価比較
    @maru = @posts.where(today_mood: "◯")
    @sankaku = @posts.where(today_mood: "△")
    @batu = @posts.where(today_mood: "×")
    # グラフ
    # 変数の生成部が1つのブロック
    @day_list = {}.tap do |result|
      @posts.each do |post|
        # 今日の日付と値に対する処理
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
    
    # 月データ範囲 月初から月末 配列に変換
    @month_days = (Date.today.beginning_of_month..Date.today.end_of_month).to_a
    
    
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
