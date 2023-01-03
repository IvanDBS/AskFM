class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)

    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Successfully registered'
    else
      flash.now[:alert] = 'Incorrect inserted data!'

      render :new
    end



    
  end
end
