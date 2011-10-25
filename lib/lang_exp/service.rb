module LangExp
  class Service
    class << self
      
      ##
      # Creates a feed in a users wall, his watchers wall and the general wall
      # ==== Parameters
      # * *user* user that creates the action
      # * *feed* specific action
      # ==== Return
      # * TBD
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

      ##
      # Helper to create feeds related to friendship actions
      # ==== Parameters
      # * *user* user that creates the action
      # * *destination_user* user that receives the action
      # * *verb* ...
      # ==== Return
      # * TBD
      def manage_friend(user, destination_user, verb)
        f = Feed.new({:title => 'New friend',:description => "You have #{verb} #{create_link(destination_user)} as friend"})
        user.own_wall.feeds << f
        
        f = Feed.new({:title => 'New friend',:description => "User #{create_link(user)} has #{verb} #{create_link(destination_user)} as friend"})
        destination_user.friends_wall.feeds << f

        f = Feed.new({:title => 'New friend',:description => "User #{create_link(user)} has #{verb} #{create_link(destination_user)} as friend"})
        User.general.own_wall.feeds << f
      end

      ##
      # Creates feeds related to an add friend action
      # ==== Parameters
      # * *user* user that creates the action
      # * *destination_user* user that receives the action
      # ==== Return
      # * TBD
      def add_friend(user, destination_user)
        manage_friend user,destination_user, 'added'
      end

      ##
      # Creates feeds related to a delete friend action
      # ==== Parameters
      # * *user* user that creates the action
      # * *destination_user* user that receives the action
      # ==== Return
      # * TBD
      def delete_friend(user, destination_user)
        manage_friend user, destination_user, 'deleted'
      end

      ##
      # Creates feeds related to an update profile action
      # ==== Parameters
      # * *user* user that creates the action
      # ==== Return
      # * TBD
      def update_profile(user)
        create_feed(user, {:title => 'Profile changed', :description => "#{create_link(user)}'s changed his profile"})
      end

      def create_link user
        "<a href='/users/#{user.username}'>#{user.username}</a>"
      end
    end
  end
end
