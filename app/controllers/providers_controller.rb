class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      flash[:notice] = 'Welcome to Gravy Train!, please follow instrucions in'\
        ' the confirmation email!'
      ProvidersMailer.register(@provider).deliver_later
      redirect_to @provider
    else
      render :new
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def confirm
    @provider = Provider.find(params[:id])
    @provider.confirmed = true
    @provider.save
    flash[:notice] = 'Your account is now confirmed'
    render :show
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :address, :email, :postcode,
      :terms_and_conditions, :about_me)
  end
end
