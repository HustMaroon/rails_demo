module UsersHelper
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		#gravatar_url = "https://secure.gravatar.com/#{gravatar_id}"
		gravatar_url = "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTDHVd6ojvtdwfRAFWDji5VYOxW4W6VUdI4YWiXGxg07Fh3xgG7"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end
