class Token
  SECRET = ENV['TOKEN_SECRET']

  class << self

    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET)
    end

    def decode(token)
      body = JWT.decode(token, SECRET)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end

    def is_expired?(expiry)
      Time.now.to_i > expiry
    end

  end
end
