class StaticPagesController < ApplicationController
  before_action :current_user

  def home
    @daily_weights = @current_user.daily_weights
  end
end
