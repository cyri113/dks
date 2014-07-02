class AddExpiryToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :expiry, :date
  end
end
