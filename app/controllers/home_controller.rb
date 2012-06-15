class HomeController < ApplicationController
  def index

		if !session[:access_token].nil?
			@graph = Koala::Facebook::API.new(session[:access_token])
			feed = @graph.get_connections("me", "feed")
			@friends_profile = @graph.get_connections("me", "friends", "fields"=>"name,birthday,gender")
			profile = @graph.get_object("me")
			session[:image]= @graph.get_picture("1310835663",:type=>"large")

#			render :text => @friends_profile.inspect and return false
			mutualfriends = @graph.get_connections("me", "mutualfriends/630625736")
#			@graph.put_connections("me", "feed", :message => "Hello ...all!")
#			@graph.put_wall_post("hey, i'm learning koala")
		end

		def facefeed
			@graph = Koala::Facebook::API.new(session[:access_token])
			@graph.put_wall_post(params["feed"])
			redirect_to "/"
		end

  end
end
