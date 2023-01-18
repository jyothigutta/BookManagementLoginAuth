class SearchbynameController < ApplicationController

    def index
        current_user=User.find_by_id(session[:current_user_id]) 
        if current_user != nil
             b = Bookdb.find_by('bookName': params[:bookName])
                if b
                     render json: b
                else 
                      render json: "Author not found."
                 end
        else 
            render json: "Kindly login to search."
        end

    end

end
