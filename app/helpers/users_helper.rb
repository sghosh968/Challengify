module UsersHelper

  def get_user_image_url(user)
    user.image.blank? ? asset_path( 'avatar5.png' ) : current_user.image.remote_url
  end

  def friend_requests_notifications(freind_requests)
    str = ""
    freind_requests.each do |friend_request|
      str +="<form action=#{friendship_process_friendship_request_path(friend_request)} data-remote=true method='post' id='process_fr_#{friend_request.id}'>
      <fieldset id=>
      <li>
        <a href='#'>
          <img src=#{ get_user_image_url(friend_request.user)} class='img-circle' alt='User Image' style='width: 25px;height: 25px;' />&nbsp;&nbsp;
          <input type='hidden' name='process' id=#{friend_request.id}>
          <span class='hidden-xs'>#{friend_request.user.name}</span>
          <div class='pull-right'>
            <button class='btn btn-success btn-xs fr_accept' value='accept_#{friend_request.id}'><i class='fa fa-fw fa-check-circle'></i>&nbsp;Accept</button>&nbsp;&nbsp;
            <button class='btn btn-danger btn-xs fr_reject' value='reject_#{friend_request.id}' ><i class='fa fa-fw fa-times-circle'></i>&nbsp;Reject</button>
          </div></br>
          <span>
            <small>#{time_ago_in_words(User.find(1).pending_received_friend_requests.first.created_at)}&nbsp;ago</small>
          </span>
        </a>
      </li></fieldset>
      </form>".html_safe()
    end
    str
  end
end
