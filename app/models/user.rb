class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :trackable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :first_name, :last_name, presence: true

  encrypts :first_name, :last_name, deterministic: true

  def self.authenticate(tone, password)
    user = User.find_for_authentication(email: tone) || User.find_for_authentication(phone: tone)
    user&.valid_password?(password) ? user : nil
  end

  has_one :wallet
  after_create :create_wallet

  private

  def create_wallet
    Wallet.create({
                    user: self
                  })
  end

end
