class MainpageController < ApplicationController
  #before_filter :authenticate_user!
  
  def page_template
    path = (params[:path] || '')
    begin
      render :template =>  "/#{path}"
    rescue Exception => e
      begin
        render :template => "/mainpage/#{path}"
      rescue Exception => e
        err e.to_s
        redirect_to "#{DOMAIN_NAME}"
      end
    end
  end
end
