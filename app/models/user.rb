class User < ActiveRecord::Base
  attr_accessible :email, :password
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: /\A.+@.+\..+\Z/
  validates :password, presence: true, on: :create

  has_many :treasures
end
