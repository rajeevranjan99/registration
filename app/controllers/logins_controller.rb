class LoginsController < ApplicationController
  def new
  end

  def show 
      @signup=Signup.all
  end

  def create 
        signup = Signup.find_by(email: params[:email])
        if signup && signup.authenticate(params[:password])
          session[:signup_id] = signup.id
          redirect_to signups_path
        else
          #flash.now.alert = "Email or password is invalid"
          render "new"
        end
  end
end
