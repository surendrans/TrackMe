class UserRequestDetailsController < ApplicationController
  # GET /user_request_details
  # GET /user_request_details.xml
  def index
    @user_request_details = UserRequestDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_request_details }
    end
  end

  # GET /user_request_details/1
  # GET /user_request_details/1.xml
  def show
    @user_request_detail = UserRequestDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_request_detail }
    end
  end

  # GET /user_request_details/new
  # GET /user_request_details/new.xml
  def new
    @user_request_detail = UserRequestDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_request_detail }
    end
  end

  # GET /user_request_details/1/edit
  def edit
    @user_request_detail = UserRequestDetail.find(params[:id])
  end

  # POST /user_request_details
  # POST /user_request_details.xml
  def create
    @user_request_detail = UserRequestDetail.new(params[:user_request_detail])

    respond_to do |format|
      if @user_request_detail.save
        format.html { redirect_to(@user_request_detail, :notice => 'User request detail was successfully created.') }
        format.xml  { render :xml => @user_request_detail, :status => :created, :location => @user_request_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_request_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_request_details/1
  # PUT /user_request_details/1.xml
  def update
    @user_request_detail = UserRequestDetail.find(params[:id])

    respond_to do |format|
      if @user_request_detail.update_attributes(params[:user_request_detail])
        format.html { redirect_to(@user_request_detail, :notice => 'User request detail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_request_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_request_details/1
  # DELETE /user_request_details/1.xml
  def destroy
    @user_request_detail = UserRequestDetail.find(params[:id])
    @user_request_detail.destroy

    respond_to do |format|
      format.html { redirect_to(user_request_details_url) }
      format.xml  { head :ok }
    end
  end
  
  def search_users
  		@emails = User.where("email like '%#{params[:q]}%'").collect{|u| {:id => u.id, :email => u.email }	 }
  		p @emails
	  render :json => @emails
  end
  
  def send_user_request
	@urd =  UserRequestDetail.find_by_sender_id_and_receiver_id(current_user.id, params[:following_id])
	if @urd
	response = {:message => "Alerdy User has been invited"}
  	else
  	UserRequestDetail.create(:sender_id => current_user.id, :receiver_id => params[:following_id], :status => true )
  	response = {:message => "Request Sent to the user"}
  	end
  	
  	render :json => response
  end
  
end

