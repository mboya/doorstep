# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  country_code           :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  status                 :boolean          default(TRUE), not null
#  type                   :string           default("user"), not null
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                     (email) UNIQUE
#  index_users_on_first_name_and_last_name  (first_name,last_name)
#  index_users_on_phone                     (phone) UNIQUE
#  index_users_on_reset_password_token      (reset_password_token) UNIQUE
#  index_users_on_unlock_token              (unlock_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :trackable

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :first_name, :last_name, :country_code, presence: true
  validates :phone, phone: true

  encrypts :first_name, :last_name, deterministic: true

  self.inheritance_column = nil

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
