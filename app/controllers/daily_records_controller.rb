class DailyRecordsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @daily_record = @user.daily_records.find_by(date: Date.current)
    end

    def new
        @user = User.find(params[:user_id])
        @daily_record = DailyRecord.new
    end

    def create
    end

    def edit
    end

    def update
    end
end
