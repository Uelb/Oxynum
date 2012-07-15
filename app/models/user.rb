class User < ActiveRecord::Base
  attr_accessible :email, :gender, :ip, :username, :fb_first_name, :fb_last_name, :location, :fb_id, :fb_status, :birthday
  has_many :dreams
  validates :username, :uniqueness => true, :length => {:minimum => 3, :maximum => 20}
  validates :ip, :presence => true
  validates :username, :presence => {:unless => Proc.new { |user| user.name.present? }} 
  validates :name, :presence => {:unless => Proc.new { |user| user.username.present? }} 
  validates :fb_id, :presence => {:if => Proc.new { |user| user.fb_first_name.present? }}
  
  def name
    if fb_first_name
      "#{fb_first_name} #{fb_last_name}"
    else
      username
    end
  end
end
