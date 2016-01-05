require_relative '../controllers/static'


class User < ActiveRecord::Base
	has_secure_password
	has_many :questions 
	has_many :answers
	# attr_accessor :password
	validates :email, uniqueness: true
	validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, multiline:true
	validates :password, length: {in: 6..15}

	# include BCrypt
	# before_save :encrypt_password

	# def password=(password)
	# 	@password = password
	# 	# byebug
	# 	@encrypted_password = BCrypt::Password.create(password)
	# 	self.encrypted_password = @encrypted_password
	# end

	# def password
	# 	@password
	# end


		
end