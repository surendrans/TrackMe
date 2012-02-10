class Api::V1::ApplicationController < Api::ApplicationController
  
  private

  def app_base_url
    "http://" +request.env['HTTP_HOST']
  end
  
  def render_json(success, message, status)
    render :json => {:success => success, :response => message}, :status => status
  end

end