class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username, null: false, unique: true

    	t.timestamps
    end

    add_index :users, :username
  end
end
