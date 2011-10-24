module LangExp
  class Service
    class << self
      
      def create_feed(user, feed)
        if feed.is_a?(Hash)
          f = Feed.new(feed)
        end
        
        user.wall.feeds << f
        
        #user.friends.each do |friend|
        #  friend.wall.feeds << f
        #end
      end
    end
  end
end