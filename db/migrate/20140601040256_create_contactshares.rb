class CreateContactshares < ActiveRecord::Migration
  def change
    create_table :contactshares do |t|
    	t.integer :contact_id, null: false
    	t.integer :user_id, null: false

      t.timestamps
    end

    add_index :contactshares, :contact_id
    add_index :contactshares, :user_id
    add_index :contactshares, [:user_id, :contact_id], :unique => true
  end
end
