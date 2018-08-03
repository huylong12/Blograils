class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
    @testsuite = @user.testsuites.paginate(page: params[:page])
  	# debugger
  end

  def new
  	@user = User.new
  	# debugger
  end

  def create
  	# debugger
	  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
