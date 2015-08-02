require 'bcrypt'

module Authenticable
  extend ActiveSupport::Concern

  MIN_PASSWORD_LENGTH = 8

  module ClassMethods

    #
    # This method determine if the user exists in the cache of not
    # First get the user via its key eg. users/1
    # Then compares the access token from the request_details from the cache
    # Faster then where access_token = access_token query
    #
    def find_by_valid_token request_details
      return false unless request_details[:user_id].present?
      obj = Redis.get("users/#{request_details[:user_id]}")
      if obj.present?
        validate_access_token JSON.parse obj
      else
        false
      end
    end

  end

  #
  # Method that assigns password to a user
  # Usage: current_user.password = '12345'
  # This method will store the field in the encrypted password column
  #
  def password=(new_password)
    @password = new_password
    self.encrypted_password = encrypt(@password) if @password.present?
  end

  #
  # Validates if the password from the credentails is correct
  #
  def valid_password?(password)
    return false if encrypted_password.blank?
    bcrypt   = ::BCrypt::Password.new(encrypted_password)
    password = ::BCrypt::Engine.hash_secret(password, bcrypt.salt)
    secure_compare(password, encrypted_password)
  end

  private

  #
  # Validates if the password exists
  #
  def validate_password_presence
    if (new_record? && @password.blank?) || (!@password.nil? && @password.empty?)
      errors.add(:password, "can't be blank")
    end
  end

  #
  # Validates if the password length
  #
  def validate_password_length
    if @password.present? && @password.length < MIN_PASSWORD_LENGTH
      errors.add(:password, "must be at least #{MIN_PASSWORD_LENGTH} characters")
    end
  end

  #
  # Validates if the access token is valid or not
  #
  def validate_access_token obj
    if obj["access_token"] == request_details[:access_token]
      User.new(obj)
    else
      false
    end
  end

  # encrypts the password
  # adjust cost for more security
  def encrypt(password)
    ::BCrypt::Password.create(password, cost: 10).to_s
  end

  # constant-time comparison algorithm to prevent timing attacks
  def secure_compare(a, b)
    return false if a.blank? || b.blank? || a.bytesize != b.bytesize
    l = a.unpack "C#{a.bytesize}"
    res = 0
    b.each_byte { |byte| res |= byte ^ l.shift }
    res == 0
  end

end
