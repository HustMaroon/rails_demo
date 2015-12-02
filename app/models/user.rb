class User < ActiveRecord::Base
	attr_accessor :remember_token
	before_save {email.downcase!}
	has_many :micoposts
	validates :name, presence: true, length: {maximum: 100}
	MAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: MAIL_VALID},
	uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 1}, allow_nil: true

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
	self.remember_token = User.new_token
	update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

end