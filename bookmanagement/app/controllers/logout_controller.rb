class LogoutController < ApplicationController
    def index
        if   session[:current_user_id] == nil
            render json: "You havent logged in."
        else   
        session[:current_user_id] = nil
        render json: "Logged out"
        end
    end
end
