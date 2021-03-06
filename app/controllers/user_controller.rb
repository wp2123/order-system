class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:user_create_customer]

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

  def user_index
    @my_customers = User.where(company_id: current_user_id, role: 'customer')
  end

  def show_customers
    @my_customers = User.where(company_id: current_user_id, role: 'customer')
  end

  def user_create_customer
    customer = User.create(user_create_customer_params)
    customer.update(role: 'customer', company_id: params[:user_id])
    render text: 'ok', status: 200
  end

  def customer_index

  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :phone, :email, :password)
  end

  def customer_params
    params.require(:user).permit(:username, :name, :phone, :email, :password, :company_id)
  end

  def user_create_customer_params
    params.require(:customer_info).permit(:username, :name, :phone, :email, :password)
  end

end
