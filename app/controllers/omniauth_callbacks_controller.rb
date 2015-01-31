class OmniauthCallbacksController < Devise::OmniauthCallbacksController
#For now only handling additon of providers, Signin/Sign up with provider is not yet implemented need to add logic for that


  def facebook
    omniauth = request.env['omniauth.auth']
    provider = Provider.find_by provider_name: omniauth.provider,uid: omniauth.uid
    if provider
      user = provider.user
      redirect_to edit_user_path(current_user) , notice: "Connected #{omniauth.provider} successfully"
    elsif user_signed_in?
      current_user.providers.create(:user_id => current_user.id , :provider_name => omniauth.provider, :uid => omniauth.uid, :token => omniauth.credentials.token, :public_url => omniauth.info.urls[omniauth.provider.capitalize], :auth_secret => omniauth.credentials.secret, :refresh_token => omniauth.credentials.refresh_token)
      redirect_to edit_user_path(current_user), notice: "Connected #{omniauth.provider} successfully"
    end
  end





end
