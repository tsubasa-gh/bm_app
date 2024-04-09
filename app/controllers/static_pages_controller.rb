class StaticPagesController < ApplicationController
  before_action :current_user

  def home
    if logged_in?
      @daily_weights = @current_user.daily_weights
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

end
