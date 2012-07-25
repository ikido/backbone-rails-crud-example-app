class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :phone
      t.string :address

      t.timestamps
    end
  end
end
