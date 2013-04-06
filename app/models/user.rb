# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy

  validates :name, presence: true, length:{maximum:50}
  validates :password, presence: true, length:{maximum:50}
  validates :password_confirmation, presence: true, length:{maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format:{with:VALID_EMAIL_REGEX}, 
            uniqueness: { case_sensitive: false }

  before_save { |user| user.email = email.downcase }
  before_save :create_remeber_token


  def feed
    Micropost.where("user_id=?",id)
  end

  private 
    def create_remeber_token
      self.remeber_token = SecureRandom.urlsafe_base64
    end
end
