class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :buildingname
      t.string :address
      t.string :city
      t.integer :zip
      t.integer :telephone
      t.string :kind
      t.string :department_fields

      t.timestamps null: false
    end
  end
end
