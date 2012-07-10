class Dream < ActiveRecord::Base
  attr_accessible :message
  validates :message, :presence => true, :length => {:maximum => 160}
  belongs_to :user
end
