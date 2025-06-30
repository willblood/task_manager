class UsersController < ApplicationController

  # Create a New User
  def create
    @user= User.new(create_params)
    if @user.save
      flash[:success]= "User Created Successfully !"
      redirect_to user_path(@user)
    else
      flash.now[:error]= "Failed Creating User!"
    end
  end

  #Show a user
  def show
    @user= User.find(params[:id])
    user_authorized?(@user)
    @tasks= @user.tasks
  end
  private

  def create_params
    params.permit(:username,:password)
  end


end
