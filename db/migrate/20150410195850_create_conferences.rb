class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.datetime :date
      t.string :locationname
      t.string :locationstreet
      t.integer :locationnumber
      t.string :locationcity
      t.integer :locationzip

      t.timestamps null: false
    end
  end
end
