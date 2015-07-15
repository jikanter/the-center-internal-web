class AddPresenterToRegistrant < ActiveRecord::Migration
  def change
    add_column :registrants, :presenter, :boolean
    add_column :registrants, :keynote, :boolean
    add_column :registrants, :legislator, :boolean
  end
end
