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
          user = User.find_by_name(params[:name].downcase)

        end
      
        desc "Returns pong if logged in correctly"
        params do
          #requires :token, type: String, desc: "Access token."
        end
        get :ping do   
          if "Bearer"!=/Bearer/.match(headers['Authorization'])[0]
            error!('Unauthorized.', 401)

          end
          { message: "pong" }
        end

      end
    end
  end
end