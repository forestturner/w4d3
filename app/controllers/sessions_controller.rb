class SessionsController < ApplicationController

  # before_action :require_no_user!, only: [:create, :new]

  def new
    if current_user.logged_in?
      redirect_to cats_url
    else
      render :new
    end
  end

  def create
    user = User.find_by_creditials(
    params[:user][:user_name],
    params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
    else
      login(user)
      redirect_to cats_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
