class RegistrationsController < Devise::RegistrationsController
  p "In registrations controller"

  before_filter :configure_permitted_parameters
  def create
    super
  end


  protected

  # my custom fields are :name
  def configure_permitted_parameters
    p "In configure permitted parameters"
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    # devise_parameter_sanitizer.for(:account_update) do |u|
    #   u.permit(:name, :email, :password, :password_confirmation, :current_password)
    # end
  end
end
