class Treasure < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, uniqueness: {scope: :user_id}

  belongs_to :user
end
