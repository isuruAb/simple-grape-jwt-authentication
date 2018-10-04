require 'jwt'
require 'bcrypt'

module V1
  module ENDPOINTS
    class Login < Grape::API
      format :json
      prefix :api
      resource :users do
        desc "Creates and returns access_token if valid login"
        params do
          requires :username, type: String, desc: "Username or email address"
          requires :password, type: String, desc: "Password"
        end
        post :login do
          user = User.find_by_username(params[:username].downcase)
          user_id=user.id
          puts user
          
          if user.password==params[:password]
            payload={"user_id":"user_id"}
            token = JWT.encode payload, ENV["SECRETKEY"], 'HS256'
            {token: token}
          else
            error!('Unauthorized.', 401)

          end
        end
      
        desc "Returns pong if logged in correctly"
        params do
          #requires :token, type: String, desc: "Access token."
        end
        get :ping do   
          if "Bearer"==/Bearer/.match(headers['Authorization'])[0]
            token=headers['Authorization'].split(" ")[1]
            decoded_token = JWT.decode token, ENV["SECRETKEY"], true, { algorithm: 'HS256' }
            { message: headers['Authorization'].split(" ")[1] }


          else
            error!('Unauthorized.', 401)

          end

        end

      end
    end
  end
end