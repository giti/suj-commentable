module Suj
  module Commentable
    module ViewHelpers
      def comments_for(commentable)
        render :partial => 'suj/commentable/commentable', :formats => [:html], :locals => { :commentable => commentable }
      end
      
      def like_url(comment, body = "like")
        rate_url(comment, body, "like")
      end
      
      def unlike_url(comment, body = "unlike")
        rate_url(comment, body, "unlike")
      end
      
      def reply_toggle( body )
        button_to body, "#", :class => 'suj-commentable-reply-toggle'
      end
      
      def rate_url(comment, body = "like", action = "like")
        render :partial => "suj/commentable/like_form", :formats => [:html], :locals => { :body => body, :comment => comment, :action => action }
      end
      
      require "digest/md5"
      
      def avatar_tag(email, options = {})
        size = options[:size] || 20
        grav_url = 'http://www.gravatar.com/avatar.php?'
        grav_url << "gravatar_id=#{Digest::MD5.new.update(email)}"
        grav_url << "&rating=#{options[:rating]}" if options[:rating]
        grav_url << "&size=#{size}"
        grav_url << "&default=#{options[:default]}" if options[:default]
        image_tag(grav_url, { :size => "#{size}x#{size}", :alt => "avatar" })
      end
    end
  end
end
