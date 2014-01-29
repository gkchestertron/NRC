class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :session_token
      t.string :name, null: false
      t.string :email, null: false
      t.boolean :admin

      t.timestamps
    end
    add_index :users, :session_token
    add_index :users, :email
    add_index :users, :password_digest
  end
end
