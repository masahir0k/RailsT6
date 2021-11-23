class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      # フォーム入力されたユーザー情報をuser変数として保存
    if user && user.authenticate(params[:session][:password])
      log_in user   # session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
