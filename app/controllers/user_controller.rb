class UserController < ApplicationController
  def admin_page
    @users = User.where(role: 'user')
    @customers = User.where(role: 'customer')
  end

  def new_user
    @user = User.new
  end

  def new_customer
    @customer = User.new
  end

end
