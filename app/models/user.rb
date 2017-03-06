class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]
  
  def self.from_omniauth(auth)
    where(email: auth.info.email).or(where(provider: auth.provider, uid: auth.uid)).first_or_initialize.tap do |user|
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.save!
    end
  end
end
