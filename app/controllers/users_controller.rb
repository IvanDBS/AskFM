class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Successfully registered'
    else
      flash.now[:alert] = 'Incorrect inserted data!'

      render :new
    end
  end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])   

      if @user.update(user_params)
      redirect_to root_path, notice: 'Successfully edited'
    else
      flash.now[:alert] = 'Incorrect inserted data!'

      render :edit
    end  
    end

    def destroy
    @user = User.find(params[:id])
    @user.destroy 

    session.delete(:user_id)

    redirect_to root_path, notice: "User deleted!"
  end  


    private

    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
    end

  
   
end
