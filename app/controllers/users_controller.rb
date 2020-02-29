class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = "Your are successfully signed up"
            redirect_to users_path
        else
            flash[:danger] = "Something went wrong please siggn up again"
            render "new"
        end
    end

    def signin

    end

    def validate
        @user = User.find_by_email(params[:user][:email].downcase)

        if @user.nil?
            flash[:danger] = "Invalid Email Id"
            render "signin"

        elsif !@user.authenticate(params[:user][:password_digest])
            flash[:danger] = "Invalid Password"
            render "signin"
        else
            session[:user_id] = @user.id
            flash[:notice] = "You have successfully Logged In"
            redirect_to users_path
        end
    end

    private
        def user_params
            params.require(:user).permit(:firstname , :lastname , :email , :password , :password_confirmation , :phone)
        end
    
end