class Base < Grape::API
    
    version 'v1', using: :path
    helpers AuthHelper

    mount V1::ENDPOINTS::Login
end
