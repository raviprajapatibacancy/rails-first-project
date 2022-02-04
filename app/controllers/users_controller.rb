class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        
        @user = User.new(user_params)
        if @user.save
          # Tell the UserMailer to send a welcome email after save
         UserMailer.with(user: @user).welcome_email.deliver_now
        
          flash[:notice] = "User created."
          redirect_to login_path
        else
          respond_to do |format|
            format.html{
              render :new,
              status: :unprocessable_entity
            }
          end
          
        end
      end

      def edit
            
      end
      
     private
      
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
end