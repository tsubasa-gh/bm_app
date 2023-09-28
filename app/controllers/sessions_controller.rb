class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      reset_session      # ログインの直前に必ずこれを書くこと
      log_in user
      redirect_to user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが無効です'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status:  :see_other
  end
end
