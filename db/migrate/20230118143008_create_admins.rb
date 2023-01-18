class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.bigint :user_id

      t.timestamps
    end
    add_index :admins, :user_id
  end
end
