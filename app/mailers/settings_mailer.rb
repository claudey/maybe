class SettingsMailer < ApplicationMailer
  def send_test_email
    mail to: params[:user].email
  end
end
