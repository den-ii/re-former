class UsersController < ApplicationController
  def new
    @user = User.new


  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    # puts(params)

    if @user.save
      redirect_to new_user_path, notice: "User created"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   puts "Userrerrrrrrrrrrrr"


   if @user.update(user_params)
    redirect_to new_user_path, notice: "User updated"
  else
    render :edit, status: :unprocessable_entity
  end

  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :password)
  end
end
