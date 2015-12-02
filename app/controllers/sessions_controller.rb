class SessionsController < ApplicationController
  def new
  end

  def create
  	 user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_back_or user
  		flash[:success] = 'Log in successfully'
  	else
  		flash.now[:danger] = 'Invalid email/pass combination'
  		render 'new'
  	end
  end
  
  def destroy
    log_out(@current_user)
    redirect_to static_pages_home_path
  end
end