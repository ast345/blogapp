class NotificationFromAdminJob < ApplicationJob
	queue_as :dafault
    include Sidekiq::Job
    include Sidekiq::Status::Worker

    def perform(msg)
        User.all.each do |user|
            NotificationFromAdminMailer.notify(user, msg).deliver_later
        end
    end
end