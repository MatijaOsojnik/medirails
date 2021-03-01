class JsonWebToken
   class << self
     def encode(payload, expiry = 24.hours.from_now)
       payload[:expiry] = expiry.to_i
       secret_key_base = ENV['JWT_SECRET']
       JWT.encode(payload, secret_key_base)
     end

     def decode(token)
       secret_key_base = ENV['JWT_SECRET']
       body = JWT.decode(token, secret_key_base)[0]
       HashWithIndifferentAccess.new body
     rescue
       nil
     end
   end
 end