class AddAdminUserToUser < ActiveRecord::Migration
  def change
    User.create(username: 'admin', password: 'admin', name: 'admin', role: 'admin')
  end
end
