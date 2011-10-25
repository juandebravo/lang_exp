module LangExp
  class Service
    class << self
      
      def create_feed(user, feed)
        if feed.is_a?(Hash)
          f = Feed.new(feed)
        end
        
        user.own_wall.feeds << f
        
        user.watchers.each do |watcher|
          watcher.friends_wall.feeds << f
        end
        
        User.where({:username => User::GENERAL}).first.own_wall.feeds << f
        
      end

      def manage_friend(user, destination_user, verb)
        f = Feed.new({:title => 'New friend',:description => "You have #{verb} #{create_link(destination_user)} as friend"})
        user.own_wall.feeds << f
        
        f = Feed.new({:title => 'New friend',:description => "User #{create_link(user)} has #{verb} #{create_link(destination_user)} as friend"})
        destination_user.friends_wall.feeds << f

        f = Feed.new({:title => 'New friend',:description => "User #{create_link(user)} has #{verb} #{create_link(destination_user)} as friend"})
        User.general.own_wall.feeds << f
      end

      def add_friend(user, destination_user)
        manage_friend user,destination_user, 'added'
      end

      def delete_friend(user, destination_user)
        manage_friend user, destination_user, 'deleted'
      end

      def update_profile(user)
        create_feed(user, {:title => 'Profile changed', :description => "#{create_link(user)}'s changed his profile"})
      end

      def create_link user
        "<a href='/users/#{user.username}'>#{user.username}</a>"
      end
    end
  end
end
