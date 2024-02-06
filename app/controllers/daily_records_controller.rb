class DailyRecordsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @daily_record = @user.daily_records.find_by(date: Date.current)
    end

    def new
        @user = User.find(params[:user_id])
        @daily_record = DailyRecord.new
        set_initial_value
    end

    def create
        @daily_record = current_user.daily_records.build(daily_record_params)
        if @daily_record.save!
            redirect_to user_daily_records_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @daily_record = @user.daily_records.find_by(date: Date.current)
        set_initial_value
    end

    def update
        @user = User.find(params[:user_id])
        @daily_record = current_user.daily_records.find_by(date: Date.current)
        if @daily_record.update(total_calorie: daily_record_params[:total_calorie].to_i + @daily_record.total_calorie,
            total_protain: daily_record_params[:total_protain].to_i + @daily_record.total_protain,
            total_fat: daily_record_params[:total_fat].to_i + @daily_record.total_fat,
            total_carbo: daily_record_params[:total_carbo].to_i + @daily_record.total_carbo)
            flash[:success] = "Updated"
            redirect_to user_daily_records_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    private

    def daily_record_params
      params.require(:daily_record).permit(:total_calorie, :total_protain, :total_fat, :total_carbo, :date )
    end

    def set_initial_value
        @daily_record.total_calorie = 0
        @daily_record.total_protain = 0
        @daily_record.total_fat = 0
        @daily_record.total_carbo = 0
        @daily_record.date = Date.current
    end
end
