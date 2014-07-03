class ChangeRoleInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :role, :string, default: :operator
  end
end
