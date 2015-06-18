class ProvidersMailerPreview < ActionMailer::Preview
  def register
    ProvidersMailer.register(Provider.first)
  end
end
