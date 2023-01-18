require 'bcrypt'
class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        current_user=User.find_by_id(session[:current_user_id])        
        
    if current_user != nil
        render json: current_user
    else
        render json: "Kindly login to view details."
    end
       
    end

    def create
        
        u = User.create(
            'name': params[:name],
            'email': params[:email],
            'password': params[:password]

        )
        if u.errors.any?
            render json: "User already exists. Kindly login"
       else 
           
            render json: "User created Sucessfully!"
       end 
    end

    def destroy

        current_user=User.find_by_id(session[:current_user_id])   
        user_sent = User.find(params[:id].to_i)
        if (current_user == user_sent) 
            user_sent.destroy
            render json: "User Account has been deleted!"
        else
            render json: "You can delete only your account. Kindly input correct id."
        end
    rescue => e
        render json: "You can delete only your account. Kindly input correct id."
    end

    def update
        current_user=User.find_by_id(session[:current_user_id])   
        user_sent = User.find(params[:id].to_i)
        if (current_user == user_sent) 
        user_sent.update('password': params[:password])
        render json: "Password updated"
        else
            render json: "Kindly input correct id.You can update only your account details."
        end
    rescue => e
        render json: " Kindly input correct id.You can update only your account details."

    end

end
