class Session < ActiveRecord::Base
  # Conference session model
  belongs_to :conference
  searchable do 
    text :title
    text :description
  end
end
