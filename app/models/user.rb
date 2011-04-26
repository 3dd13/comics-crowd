class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :is_admin, :username
  # , :password_confirmation
  
  has_many :ratings
  has_many :comics, :through => :ratings
  
  validates_presence_of :email, :username
  validates_format_of :username, :with => /\w+/  
  validates_length_of :username, :minimum => 6, :maximum => 10
  validates_uniqueness_of :username, :email
end
