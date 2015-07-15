class Registrant < ActiveRecord::Base
  belongs_to :conference
  searchable do
   text :firstname
   text :lastname
  end
end
