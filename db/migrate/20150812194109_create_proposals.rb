class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :abstract

      t.timestamps null: false
    end
  end
end
