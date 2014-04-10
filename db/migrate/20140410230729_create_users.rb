class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :phone
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
