class AddConferenceIdToRegistrant < ActiveRecord::Migration
  def change
    add_column :registrants, :conference_id, :integer
  end
end
