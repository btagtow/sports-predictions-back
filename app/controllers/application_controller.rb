class ApplicationController < ActionController::API

    def authenticate 

        auth_header = request.headers["Authorization"]

        if auth_header
            token = auth_header.split(" ")[1]
            secret = Rails.application.secrets.secret_key_base

            decoded_token = JWT.decode(token, secret)
            payload = decoded_token.first
            user_id = payload["user_id"]
        else
            render json: { message: "not allowed"}
        end

    end

end
