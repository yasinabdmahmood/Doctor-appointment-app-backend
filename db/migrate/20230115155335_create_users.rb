class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :isAdmin, default: false

      t.timestamps
    end
  end
end
