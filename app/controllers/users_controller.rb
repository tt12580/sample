class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user=User.find(params[:id])
    #debugger
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "SUCCESS"
    else
      flash[:error] = "ERROR"
      redirect_to users_url
    end
end
  private

    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
