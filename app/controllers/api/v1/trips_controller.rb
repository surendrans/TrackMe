class Api::V1::TripsController < Api::V1::ApplicationController


	def create 
		@trip = Trip.new(:name => params[:name], 
						:starting => params[:starting], :destination => params[:destination])
		if @trip.save
			response = {:success => true, :s_id => @trip.id  , :msg => "Successfull"}
		else
			response = {:success => false, :msg => "failed" }
		end
		puts response,"============================="
		render :json => response
	end
	
	def update_status
	@trip = Trip.find(params[:id])
	@trip.started = params[:status] == "start" ? true : false
	@trip.started = params[:status] == "stop" ? true : false
	@trip.save
	render :json => {:success => true, :s_id => @trip.id  , :msg => "Successfull"}
	end

  end
