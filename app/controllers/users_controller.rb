class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path, notice: "User created"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :password)
  end
end