class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url(@user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new(user_params)

  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.id = params[:id].to_i
      render :show
    else
      redirect_to new_session_url
    end
  end


  private
  def user_params
    params.require(:user).permit([:user_name, :password])
  end

end
