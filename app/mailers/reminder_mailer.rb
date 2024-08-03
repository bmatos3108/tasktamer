class ReminderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def reminder_email(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: 'Reminder: Your Task is Due Soon! 😊')
  end
end
