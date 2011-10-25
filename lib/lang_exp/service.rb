module LangExp
  class Service
    class << self
      
      def create_feed(user, feed)
        if feed.is_a?(Hash)
          f = Feed.new(feed)
        end
        
        user.own_wall.feeds << f
        
        #user.watchers.each do |watcher|
        #  watcher.friends_wall.feeds << f
        #end
        
        User.where({:username => User::GENERAL}).first.own_wall.feeds << f
        
      end
    end
  end
end