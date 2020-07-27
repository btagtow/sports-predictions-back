class GameSelectionsController < ApplicationController

    before_action :authenticate

    def index 
        @game_selections = GameSelection.all 
        render json: @game_selections 
    end

    def show 
        @game_selections = GameSelection.where(user_id: params[:id]) 
        render json: @game_selections 
    end

    def create 
        @game_selection = GameSelection.create(game_selections_params) 
        
        if @game_selection.save 
            render json: {
                message: "Accepted", 
                game_selection: @game_selection
            }
        else
            render json: @game_selection.errors
        end
    end

    def destroy 
        GameSelection.destroy(params[:id])
        render json: "Destroyed"
    end

    private 

    def game_selections_params
        params.require(:game_selection).permit(
            :dateEvent,
            :idAwayTeam,
            :idEvent,
            :idHomeTeam,
            :idLeague,
            :strAwayTeam,
            :strEvent,
            :strEventAlternate,
            :strHomeTeam,
            :strLeague,
            :strPostponed,
            :strSeason,
            :strSport,
            :strTime,
            :completed,
            :correctSelection,
            :dateOfSelection,
            :selectedWinnerId,
            :selectedWinnerString,
            :points_allocated
            ).merge(user_id: @user_id)

    end

end
