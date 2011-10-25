module ApplicationHelper

  def friend_link(current_user, user)
    if current_user.friends.select{|friend| friend.username.eql?(user.username)}.empty?
      link_to 'Add friend', user_add_friend_path(current_user.username, user.username), :method => 'post'
    else
      link_to 'Delete friend', user_delete_friend_path(current_user.username, user.username), :method => 'delete'
    end
  end
  
  def time_ago(time)
    now = Time.now
    hours = ((Time.now - time)/(60*60)).to_s.split(".").first.to_i
    hours = hours > 0 ? "#{hours}h ago" : "0h"
    minutes = "#{rand(59)} minutes"
    seconds = "#{rand(59)} seconds"
    [hours, minutes, seconds].join(", ")
  end

end
