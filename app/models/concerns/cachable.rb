module Cachable
  extend ActiveSupport::Concern

  #
  # Updates a cachable object
  # Eg. "users/1" key to its serialized json form
  #
  def update_cache
    if $redis.set("#{self.class.table_name}/#{self.id}", self.to_json) == "OK"
      true
    else
      false
    end
  end

end
