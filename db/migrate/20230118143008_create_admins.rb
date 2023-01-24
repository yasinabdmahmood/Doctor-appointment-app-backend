class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.bigint :account_id

      t.timestamps
    end
    add_index :admins, :account_id
  end
end
