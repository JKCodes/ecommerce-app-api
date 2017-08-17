class Api::V1::AuthController < ApplicationController
  before_action :authenticate_token!, only: [:refresh]

  def login
    @user = User.find_by(email: params[:user][:email])

    if !@user
      render json: {
        errors: {
          email: ["Unable to find a user with the provided email address"]
        }
      }, status: 500
    elsif @user && @user.authenticate(params[:user][:password])
      render "users/user_with_token.json.jbuilder", user: @user
    else
      render json: {
        errors: {
          password: ["Password does not match the provided email"]
        }
      }, status: 500
    end
  end

  def fetch
    token = params["token"]
    begin
      user_id = Auth.decode_token(token)[0]["user_id"]
      user = User.find(user_id)
      render json: {
        user: user
      }
    rescue JWT::VerificationError
      render json: {
        errors: {
          user: ["No user exists with the provided token"]
        }
      }, status: 500
    end
  end

  def refresh
    render "users/user_with_token.json.jbuilder", user: @user
  end
end