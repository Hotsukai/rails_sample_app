# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      remember user
      params[:session][:remember_me] == 1 ? remember(user) : forget(user)
      redirect_back_or user
    else
      # エラーを表示
      flash.now[:danger] = 'メールアドレスかパスワードに誤りがあります'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    # redirect_to root_url
    redirect_to root_path
  end
end
