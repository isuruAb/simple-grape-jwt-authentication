class Base < Grape::API
    
    version 'v1', using: :path
    mount V1::ENDPOINTS::Login
end
