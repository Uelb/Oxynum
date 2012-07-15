class User < ActiveRecord::Base
  attr_accessible :email, :gender, :ip, :username, :fb_first_name, :fb_last_name, :location, :fb_id, :fb_status, :birthday
  has_many :dreams
  validates :username, :uniqueness => true, :length => {:minimum => 3, :maximum => 20}
  validates :ip, :presence => true  
  def name
    if fb_first_name
      "#{fb_first_name} #{fb_last_name}"
    else
      username
    end
  end
end
