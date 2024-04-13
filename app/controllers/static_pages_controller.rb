class StaticPagesController < ApplicationController
  before_action :current_user

  def home
    if logged_in?
      @daily_weights = @current_user.daily_weights
      @start_date = return_date(params[:period])
      a = params[:period]
      puts "xxxxxxxxxxxxxxx", a.nil?, @start_date
    end
  end

  def past
    @date = params[:date]
    if @date.nil?
      @date = Date.current
    end
    @daily_weight = @current_user.daily_weights.find_by(date: @date)
    @daily_record = @current_user.daily_records.find_by(date: @date)
  end

  #取得した表示期間に適する日付を返す
  def return_date(period)
    case period
    when "week"
      return Date.current.days_ago(7)
    when "month"
      return Date.current.last_month
    when "3month"
      return Date.current.months_ago(3)
    when "6month"
      return Date.current.months_ago(6)
    when "year"
      return Date.current.last_year
    when nil
      return Date.current.days_ago(7)
    end
  end

end
