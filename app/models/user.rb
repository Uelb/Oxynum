class User < ActiveRecord::Base
  attr_accessible :email, :gender, :ip, :username
  has_many :dreams
  validates :username, :uniqueness => true, :length => {:minimum => 3}
end
