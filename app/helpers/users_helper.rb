module UsersHelper

  def get_user_image_url(user)
    user.image.blank? ? asset_path( 'avatar5.png' ) : current_user.image.remote_url
  end
end
