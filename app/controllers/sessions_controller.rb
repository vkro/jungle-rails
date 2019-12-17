class SessionsController < ApplicationController

  def new
  end

  def create
    # if the user exists AND the password entered is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # save the user id inside the browser cookie to keep the user logged in
      session[:user_id] = user.id
      redirect_to '/'
    else
    #   # if user's login doesn't work, send them back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
