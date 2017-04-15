class AddFullNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :last_name, :string
	add_column :users, :gender, :string
	add_column :users, :dob, :date
  end
end
