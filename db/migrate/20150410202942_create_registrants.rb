class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.string :firstname
      t.string :lastname
      t.string :middleinitial
      t.integer :homenumber
      t.string :homestreet
      t.string :homecity
      t.string :homestate
      t.integer :homezip
      t.string :homephone
      t.string :cellphone
      t.string :businessname
      t.integer :businessnumber
      t.string :businessstreet
      t.string :businesscity
      t.string :businessstate
      t.integer :businesszip

      t.timestamps null: false
    end
  end
end
