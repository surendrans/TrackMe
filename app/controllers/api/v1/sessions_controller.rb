class Api::V1::SessionsController < Api::V1::ApplicationController
  #prepend_before_filter :require_no_authentication, :only => [:get_authentication_token]
  #before_filter :ensure_params_exist

  def get_authentication_token
    user = User.find_by_email(params[:user][:email])
    password = params[:user][:password]
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.encrypted_password)
      status = true
      render_json(true, {:auth_token => user.authentication_token}, 200)
    else
      render_json(false, "Invalid login or password", 401)
    end
  end

  def create_user
  puts "-------------------------------------------------------"
  p "==========================", params,"======"
    user = User.new(params[:user])
#    user.password_confirmation = user.password
 #   user.came_via = "API:: #{request.env["HTTP_USER_AGENT"]}"
    if user.save
    p user.authentication_token, user,"------------"
      render_json(true, {:auth_token => user.authentication_token}, 200)
    else
      render_json(true, {:errors => user.errors.full_messages.join("<br/>")}, 422)
    end
  end

  private
  
  def ensure_params_exist
    return if params[:user]
    render_json(true, "Missing user crdentials", 422)
  end


end
