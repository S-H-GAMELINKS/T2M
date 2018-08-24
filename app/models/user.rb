class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_oauth(auth)
    user = User.where(provider: auth.provider, email: User.dummy_email(auth)).first

    if user != nil then
      user.update!(uid: auth.extra.raw_info.display_name)
    end

    unless user
      user = User.create(
        uid:      auth.extra.raw_info.display_name,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        token: auth.credentials.token.to_s
      )
      user.save!
    end
    current_user = user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}"
  end
end