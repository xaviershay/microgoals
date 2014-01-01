require 'securerandom'

secret_file = "config/secret_key_base"

Microgoals::Application.config.secret_key_base = if File.exists?(secret_file)
  File.read(secret_file).chomp
else
  x = SecureRandom.hex(128)
  File.write(secret_file, x)
  x
end
