class AuthenticationController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update]

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

    def edit
    end

    def update
        if Current.user.authenticate(params[:user][:current_password])
            if Current.user.update(user_params)
                redirect_to root_path, notice: "User details updated successfully"
            else
                render :edit, status: :unprocessable_entity
            end
        else
            flash.now[:alert] = "Incorrect password. Changes were not saved."
            render :edit, status: :unprocessable_entity
        end
    end

    def forgot
    end

    def reset
        @user = User.find_by(email: params[:email])

        if @user.present?
            ResetPasswordMailer.with(user: @user).reset.deliver_later

            redirect_to root_path, notice: "An email will be sent to #{@user.email} with instructions for resetting your password."
        else
            flash.now[:alert] = "Email address is not associated with our Blog App account"
            render :forgot, status: :unprocessable_entity
        end
    end

    def password
        @user = User.find_signed(params[:token], purpose: "password_reset")
    end

    def change
        @user = User.find_signed(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to login_path, notice: "Your password was reset successfully. Please sign in."
        else
            render :password, status: :unprocessable_entity
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end


end