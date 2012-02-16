class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  before_save :ensure_authentication_token
  
  has_many :trips
  has_many :requests, :class_name => "UserRequestDetail", :foreign_key => :receiver_id
  has_many :sent_requests, :class_name => "UserRequestDetail", :foreign_key => :sender_id
  
  acts_as_followable
  acts_as_follower
end
