class DreamWords < ActiveRecord::Base
  attr_accessible :word
  validates :word, :presence => true
  has_and_belongs_to_many :dream 
end