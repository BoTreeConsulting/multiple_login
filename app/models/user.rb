class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:provider
  # attr_accessible :title, :body

	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["member_hash"]
				member.email = data["email"]
			end
			if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["member_hash"]
				member.email = data["email"]
			end
			if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["member_hash"]
				member.email = data["email"]
			end
			if data = session['devise.googleapps_data'] && session['devise.googleapps_data']['member_info']
				member.email = data['email']
			end
			if data = session['devise.linkedin_data'] && session['devise.linkedin_data']['member_info']
				member.email = data['email']
			end
		end
	end




end
