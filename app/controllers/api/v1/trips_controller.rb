class Api::V1::TripsController < Api::V1::ApplicationController
	before_filter :authenticate_user!
   before_filter :get_user

	def create 
		
		@trip = @user.trips.new(:name => params[:name], 
						:starting => params[:starting], :destination => params[:destination])
		if @trip.save
			response = {:success => true, :s_id => @trip.id  , :msg => "Successfull"}
		else
			response = {:success => false, :msg => "failed" }
		end
		render :json => response
	end
	
	def update_status
		@trip = Trip.find(params[:id])
		@trip.started = params[:status] == "start" ? true : false
		@trip.started = params[:status] == "stop" ? true : false
		@trip.save
		render :json => {:success => true, :s_id => @trip.id  , :msg => "Successfull"}
	end
	
	private 
	def get_user
      @user = User.find_by_authentication_token params['auth_token']
    end

  end
