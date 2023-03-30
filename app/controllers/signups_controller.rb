class SignupsController < ApplicationController
  http_basic_authenticate_with name: "humbaba", password: "5baa61e4"
  def index
    @signup = Signup.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @signup }
      format.json { render json: @signup }
    end
  end
  
  def show 
    @signup=Signup.find(params[:id])
  end
  
  def new
    @signup=Signup.new 
  end

  def create 
    # debugger 
    @signup=Signup.new(signup_params)
    if @signup.save 
      # SignupMailer.welcome_email.deliver
      #SignupMailer.with(signup: @signup).welcome_email.deliver_now
      SignupJob.perform_now(@signup)

      redirect_to new_login_path
    else
      render "new"
    end
  end
  
  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
    redirect_to new_login_path
  end

  private 
    def signup_params 
      params.require(:signup).permit(:email, :password)
    end
end
