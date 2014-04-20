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
    return role == 'admin' ? true : false
  end

  def user?
    return role == 'user' ? true : false
  end

end
