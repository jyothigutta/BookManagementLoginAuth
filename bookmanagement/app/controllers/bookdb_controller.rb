class BookdbController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        current_user=User.find_by_id(session[:current_user_id])  
        if current_user != nil
        render json: Bookdb.all
        else 
            render json: "Kindly login to view book details"
        end
    end

    def show
        current_user=User.find_by_id(session[:current_user_id])  
        if current_user != nil

                 b = Bookdb.find(params[:id])
                render json: b
        else
            render json: "Kindly login to view book details"
        end
     rescue => e
        render json: "Book not found. Kindly input correct data."
    end 


    def create    
        current_user=User.find_by_id(session[:current_user_id])  
        if current_user != nil

        b= Bookdb.create('bookName': params[:bookName],
            'bookAuthor': params[:bookAuthor], 
            'bookQuantity': params[:bookQuantity])  
        if(b.errors.any?)               
            render json: "Book already exists, Kindly update quantity"    
        else 
            render json: "Book Details Saved!"   
        end 

    else
        render json: "Kindly login to create book entry"
    end

    end

    def update

        current_user=User.find_by_id(session[:current_user_id])  
        if current_user != nil  
        b=Bookdb.find(params[:id].to_i)
        b.update('bookName': params[:bookName],
            'bookAuthor': params[:bookAuthor], 
            'bookQuantity': params[:bookQuantity])
        render json: "Book Data Updated Sucessfully!"
        else 
            render json: "Kindly login to update book entry"
        end 

        rescue => e
        render json: "Book not found. Kindly input correct data."
    
    end

    def destroy

    current_user=User.find_by_id(session[:current_user_id])  
    if current_user != nil      
        b=Bookdb.find(params[:id].to_i)
        b.destroy
        render json: "Book data has been deleted!"
    else 
        render json: "Kindly login to delete book entry"
    end
    rescue => e
        render json: "Book not found. Kindly input correct data."
    end

end
