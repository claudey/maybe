class ApplicationMailer < ActionMailer::Base
  default from: ENV["SMTP_USERNAME"]
  layout "mailer"

  alias_method :super_mail, :mail
  def mail(headers = {}, &block)
    headers[:from] = Setting.smtp_username
    headers[:delivery_method] = Rails.env.test? ? :test : "smtp"
    # headers[:delivery_method_options] = Setting.smtp_settings.deep_symbolize_keys
    super_mail(headers, &block)
  end
end
