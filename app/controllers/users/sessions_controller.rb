class Users::SessionsController < Devise::SessionsController
	
	def new
		@notice = flash[:notice]
		if @notice != nil
			@notice = flash[:notice]
		else
			@notice = []
		end
		puts "========="
		puts flash[:alert]
		if flash[:alert] == nil
			@pageAction = ''
			puts "AAAAAA == #{@pageAction}"
		else
			@pageAction = "loginFail"
			puts "AAAAAA == #{@pageAction}"
		end

		super
	end

	def create
		puts "test=============="
		self.resource = warden.authenticate!(auth_options)
	    set_flash_message!(:notice, :signed_in)
	    sign_in(resource_name, resource)
	    yield resource if block_given?
	    respond_with resource, location: after_sign_in_path_for(resource)
	end
end