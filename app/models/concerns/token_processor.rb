module TokenProcessor
  extend ActiveSupport::Concern

  def set_access_token
    self.update_attribute(:access_token, SecureRandom.hex(20))
  end

  def destroy_token
    self.update_attribute(:access_token, "")
  end

end
