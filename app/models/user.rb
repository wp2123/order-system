class User < ActiveRecord::Base

  def self.authenticate(username, submitted_password)
    user = find_by(username: username)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def has_password?(submitted_password)
    password == submitted_password
  end

  def admin?
    role == 'admin' ? true : false
  end

  def user?
    role == 'user' ? true : false
  end

  def customer?
    role == 'customer' ? true : false
  end

end
