class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :is_admin, :username
  # , :password_confirmation

  has_many :ratings
  has_many :comics, :through => :ratings

  validates_presence_of :email, :username
  validates_format_of :username, :with => /\w+/  
  validates_length_of :username, :minimum => 6, :maximum => 25
  validates_uniqueness_of :username, :email

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create!(:username => data["name"], :email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
        user.username = data["name"]
      end
    end
  end  
end
