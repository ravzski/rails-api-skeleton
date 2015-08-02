Class Redis

  def class.get key
    $redis.get(key)
  end

  def self.set key, value
  end

end
