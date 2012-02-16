class Api::V1::UsersController < Api::V1::ApplicationController
	before_filter :authenticate_user!
   before_filter :get_user
   
   def follow_request
		render :json => sender_information(current_user.requests(:include => :sender))
   end
   
   def request_confirmation
   end
   
   
   def sender_information(users)
   	users.map{|user|
   		{:email => user.email, :id => user.id }
   	}
   end
   
end
