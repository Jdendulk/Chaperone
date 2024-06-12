class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meetings
  has_many :friends, dependent: :destroy
  has_many :messages

  before_save :generate_share_code

  def generate_share_code
    self.share_code = SecureRandom.urlsafe_base64(nil, false)
  end
end
