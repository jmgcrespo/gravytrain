class ProvidersController < ApplicationController

  def new
    @provider = Provider.new
  end

  def create
    @provider=Provider.new(provider_params)
    if @provider.save
      flash[:notice] = "Welcome to Gravy Train!"
      ProvidersMailer.register(@provider).deliver_later
      redirect_to @provider
    else
      render :new
    end
  end

  def show
    @provider=Provider.find(params[:id])
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :address, :email, :postcode,
      :terms_and_conditions, :about_me)
  end
end
