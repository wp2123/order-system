class UserController < ApplicationController
  def admin_page
    @users = User.where(role: 'user')
    @customers = User.where(role: 'customer')
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    @user.role = 'user'

    if @user.save
      redirect_to action: 'admin_page'
    end
  end

  def new_customer
    @customer = User.new
  end

  def create_customer
    @customer = User.new(customer_params)
    @customer.role = 'customer'

    if @customer.save
      redirect_to action: 'admin_page'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :phone, :email, :password)
  end

  def customer_params
    params.require(:user).permit(:username, :name, :phone, :email, :password, :company_id)
  end

end
