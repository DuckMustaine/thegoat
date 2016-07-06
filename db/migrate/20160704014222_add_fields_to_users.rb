class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :team, :string
  	add_column :users, :role, :integer, :default => 0
  end
end
