module GamesHelper
    def favorite_link(game)
        if current_user
             if current_user.favorite_ids.include?(game.id)
                return link_to icon('fas', 'star'), favorite_game_path(game, type: "unfavorite"), method: :put
            else
                return link_to icon('far', 'star'), favorite_game_path(game, type: "favorite"), method: :put
            end
            return link_to icon('far', 'star'), new_user_registration_path
                

        end 

    end 
end
