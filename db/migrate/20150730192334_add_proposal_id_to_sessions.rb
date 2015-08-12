class AddProposalIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :proposal_id, :string
  end
end
