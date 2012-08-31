class Dream < ActiveRecord::Base
  attr_accessible :message
  validates :message, :presence => true, :length => {:maximum => 160}
  belongs_to :user
  has_and_belongs_to_many :words
  #before_create :create_words
  
  def decompose
    self.message.split(/[ ,:'"\%\<\>\-\+\_\=\.\(\)\/]/).each do |word_value|
      if word_value.length > 2
        yield word_value
      end
    end
  end  
  
  #def create_words
  #  self.decompose do |word_value|
  #    @word = DreamWords.new
  #    @word.word= word_value
  #    self.words << @word
  #    @word.save
  #  end
  #end
    
  def similar_dreams
    dreams= Array.new
    self.decompose do |word_value|
      dreams << DreamWords.where("word like (?)",word_value).first.dream
    end
  end
end
