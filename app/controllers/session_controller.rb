class SessionController < ApplicationController

  def new
    redirect_by_role current_user if signed_in?
  end

  def create
    user = User.authenticate(params[:session][:username], params[:session][:password])
    if user.nil?
      flash[:error] = "登录邮箱或密码错误。"
      redirect_to signin_path
    else
      sign_in user
      redirect_by_role user
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

  private

  def redirect_by_role(user)
    if user.admin?
      redirect_to admin_path
    elsif user.user?
      redirect_to users_path
    else
      redirect_to customers_path
    end
  end

end
