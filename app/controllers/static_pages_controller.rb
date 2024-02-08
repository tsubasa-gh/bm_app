class StaticPagesController < ApplicationController
  before_action :current_user

  def home
    @daily_weights = @current_user.daily_weights
  end

  def past
    @daily_weights = @current_user.daily_weights
    @daily_records = current_user.daily_records
  end
end
