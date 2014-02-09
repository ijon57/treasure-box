class Treasure < ActiveRecord::Base

  scope :recent, ->(num=5){ order('created_at desc').limit(num) }

  attr_accessible :name
  validates :name, presence: true, uniqueness: {scope: :user_id}

  belongs_to :user
end
