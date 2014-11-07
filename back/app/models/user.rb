class User < ActiveRecord::Base
  before_save :ensure_auth_token

  devise :database_authenticatable, :registerable, :validatable

  def ensure_auth_token
    self.authentication_token = generate_auth_token if authentication_token.blank?
  end

  private

  def generate_auth_token
    begin
      token = Devise.friendly_token
    end while User.where(authentication_token: token).first
    token
  end
end
