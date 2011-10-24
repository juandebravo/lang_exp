module ApplicationHelper

  def friend_link(current_user, user)
    if current_user.friends.select{|friend| friend.username.eql?(user.username)}.empty?
      link_to 'Add friend', user_add_friend_path(current_user.username, user.username), :method => 'post'
    else
      link_to 'Delete friend', user_delete_friend_path(current_user.username, user.username), :method => 'delete'
    end
  end

end
