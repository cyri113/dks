class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :sym
      t.string :website
      t.string :om_email
      t.references :user, index: true

      t.timestamps
    end
  end
end
