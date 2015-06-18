class ProvidersMailer < ActionMailer::Base
  def register(provider)
    @provider = provider
    mail to: provider.email, from: 'noreply@gravytrain.com',
      subject: 'Thanks for register'
  end
end
