class AuthenticationController < ApplicationController
    
    def login
        @user = User.find_by(username: params[:username])

        if @user

            if @user.authenticate(params[:password])

                token = createToken(@user)

                render json: { token: token, user_id: @user.id, user: @user }, status: 200, include: :game_selections
                
            else
                render json: {message: "Login info incorrect", status: :unauthorized}, status: :unauthorized
            end
        else
            render json: {message: "Username doesn't exist", status: :unauthorized}, status: :unauthorized
        end
    end

end