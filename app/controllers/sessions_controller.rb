class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by_username params[:username]


    if user.authenticate(params[:password]) && user!=nil

      session[:user_id]=user.id
      redirect_to functions_path, notice: "Signed in!"
    else
      redirect_to functions_path, notice: "Wrong credentials!"
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to functions_path, notice: "Signed out!"

  end

end
