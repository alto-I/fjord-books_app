# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, uniqueness: { scope: :provider }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_github_oauth(auth, _signed_in_resource = nil)
    user = User.find_or_initialize_by(provider: auth.provider,
                                      uid: auth.uid,
                                      name: auth.info.name,
                                      email: auth.info.email)
    if user.new_record?
      user.password = Devise.friendly_token[0, 20]
      user.save
    end
    user
  end
end
