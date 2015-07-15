class Conference < ActiveRecord::Base
  has_many :registrants, dependent: :destroy
  has_many :sessions, dependent: :destroy
end
