class RelationshipMailer < ApplicationMailer
	def new_follower(user, follower)
		@user = user
		@follower =follower
		mail to: user.email, subject: '【blogappお知らせ】'
	end
end