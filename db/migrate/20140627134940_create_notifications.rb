class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :title
      t.text :content
      t.references :product, index: true
      t.references :instruction, index: true

      t.timestamps
    end
  end
end
