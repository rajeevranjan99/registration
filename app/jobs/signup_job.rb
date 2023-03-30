class SignupJob < ApplicationJob
  queue_as :default

  def perform(signup)
    # Do something later
    SignupMailer.welcome_email(signup).deliver_now
  end
end
