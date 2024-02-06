class DailyWeightsController < ApplicationController

    def new
        @user = User.find(params[:user_id])
        @daily_weight = DailyWeight.new
        @daily_weight.date = Date.current
    end

    def create
        @daily_weight = current_user.daily_weights.build(daily_weight_params)
        if @daily_weight.save!
          redirect_to root_path
        else
          render 'new', status: :unprocessable_entity
        end
    end

    def destroy

    end

    private

    def daily_weight_params
      params.require(:daily_weight).permit(:daily_weight, :date )
    end
end
