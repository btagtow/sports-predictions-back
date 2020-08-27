class ApplicationController < ActionController::API

    def authenticate
        @user = User.find_by(username: params[:username])

        authorization_header = request.headers["Authorization"]

        if authorization_header
            token = authorization_header.split(" ")[1]
            begin
                secret = Rails.application.secrets.secret_key_base
                
                # @user_id = JWT.decode(token, secret)[0]["user_id"]
                decoded_token = JWT.decode(token, secret)
                payload = decoded_token[0]
                @user_id = payload["user_id"]
            rescue
                render json: {message: "Not authorized"}, status: :unauthorized
            end
        else
            render json: {message: "Not authorized."}, status: :unauthorized
        end
    end

    def createToken(user)
        payload = { user_id: user.id, user: @user }
        secret = Rails.application.secrets.secret_key_base
        JWT.encode(payload, secret)
    end

end
