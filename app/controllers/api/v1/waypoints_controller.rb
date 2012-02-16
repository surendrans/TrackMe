class Api::V1::WaypointsController < Api::V1::ApplicationController
	
	before_filter :authenticate_user!
   before_filter :get_user
	
	def create 
		@waypoint = Waypoint.new(:trip_id => params[:trip_id], :client_time => params[:client_time],
									:latitude => params[:latitude], :longitude => params[:longitude])
		if @waypoint.save
			response = {:success => true, :trip_source_id => params[:trip_id],
							 :s_id => @waypoint.id  , :msg => "Successfull"}
		else
			response = {:success => false, :msg => "failed" }
		end
		render :json => response
	end
	
	 private 

    def get_user
      @user = User.find_by_authentication_token params['auth_token']
    end

  end
