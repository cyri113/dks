class AddPublishedToMany < ActiveRecord::Migration
  def change
  	add_column :products, :published, :boolean
  	add_column :instructions, :published, :boolean
  	add_column :notifications, :published, :boolean
  end
end
