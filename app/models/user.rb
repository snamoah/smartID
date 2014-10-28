class User < ActiveRecord::Base
  has_many :credentials
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true
end
