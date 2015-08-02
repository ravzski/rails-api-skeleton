class User < ActiveRecord::Base
  include Authenticable
  include TokenProcessor
  include Searchable
  include Searchable
  include Cachable

  SESSION_DETALS = %w(
    users.id
    users.first_name
    users.last_name
    users.email
    users.encrypted_password
    users.access_token
  )

  validates :email, presence: true, email: true, uniqueness: true
  validate :validate_password_presence
  validate :validate_password_length

  after_commit :update_cache

  def full_name
    "#{first_name} #{last_name}"
  end


  def self.find_by_credentials creds
    user = self.find_by_email(creds[:email])
    user if user.present? && user.valid_password?(creds[:password])
  end

  private

  def update_cache
    self.update_cache
  end


end
