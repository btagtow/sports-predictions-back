class UsersController < ApplicationController

    before_action :authenticate, only: [:index, :show, :update]

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user, include: :game_selections
    end

    def update
        @user = User.find(params[:id])
        @user.update(betting_points: params[:betting_points])
        render json: @user
    end

    def create
        @user = User.new(user_params)

         if @user.save
            token = createToken(@user)
            render json: {
                message: "Congrats #{@user.username}, your account has been created!",
                token: token,
                user: @user
            }
        else
            render json: { message: @user.errors.messages }
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :betting_points)
    end

end
