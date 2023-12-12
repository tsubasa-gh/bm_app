class FoodsController < ApplicationController
  before_action :correct_user,   only: :destroy

    def index
        @user = User.find(params[:user_id])
        @foods = @user.foods
    end

    def show
        @user = User.find(params[:user_id])
        @food = @user.foods.find(params[:id])
    end

    def new
        @user = User.find(params[:user_id])
        @food = Food.new
    end

    def create
        #@food = Food.new(food_params)
        #@food.user_id = current_user.id
        @food = current_user.foods.build(food_params)
        if @food.save!
          redirect_to user_foods_path
        else
          render 'new', status: :unprocessable_entity
        end
    end

    def destroy
      @food.destroy
      flash[:success] = "削除されました"
      redirect_to user_foods_path, status: :see_other
    end

    private

      def food_params
        params.require(:food).permit(:name, :calorie, :protain, :fat, :carbo )
      end

      def correct_user
        @food = current_user.foods.find_by(id: params[:id])
        redirect_to root_url, status: :see_other if @food.nil?
      end
end
