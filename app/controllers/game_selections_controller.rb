class GameSelectionsController < ApplicationController

    before_action :authenticate

    

    def index 
        @game_selections = GameSelection.all 
        render json: @game_selections 
    end

    def create 
        @game_selection = GameSelection.create(game_selections_params) 
        
        if @game_selection.save 
            render json: {
                message: "Accepted", 
                game_selection: @game_selection            
            }, include: :user
        else
            render json: @game_selection.errors
        end
    end

    def destroy 

        @game_selection = GameSelection.destroy(params[:id])
        render json: {message: "Destroyed", deleted_game: @game_selection}
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
