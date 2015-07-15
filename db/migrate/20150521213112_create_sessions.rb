class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :presenterid
      t.integer :copresenter_id
      t.integer :conferenceid
      t.string :title
      t.string :description
      t.datetime :starttime
      t.datetime :endtime
      t.string :strand
      t.integer :roomid
      t.integer :level
      t.integer :setuporderid
      t.string :language

      t.timestamps null: false
    end
  end
end
