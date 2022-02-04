class SessionsController < ApplicationController

    def new
    end
    
    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:notice] = "Logged in successfully."
          redirect_to dashboard_path
        else
          flash.now[:alert] = "There was something wrong with your login details."
          respond_to do |format|
            format.html{
              render :new,
              status: :unprocessable_entity
            }
          end
        end
      end
       
      def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to login_path
      end
end
