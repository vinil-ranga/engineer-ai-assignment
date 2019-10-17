class AuthenticationToken < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  private
  def generate_token
    token = Devise.friendly_token
    while AuthenticationToken.find_by(auth_token: token )
      token = Devise.friendly_token
    end
    self.auth_token = token
  end
end
