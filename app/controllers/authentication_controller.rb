class AuthenticationController < ApplicationController

    def login

    end
    
    def signin
        @user = User.find_by(email: params[:email])

        if @user.present? && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash.now[:alert] = "Invalid email or password"
            render :login, status: :unprocessable_entity
        end
    end

    def register
        # create new User model object
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully registered!"
        else
            render :register, status: :unprocessable_entity
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path, notice: "User logged out!"
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end