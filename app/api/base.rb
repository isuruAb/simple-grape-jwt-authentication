class Base < Grape::API
    include V1::Helpers

    version 'v1', using: :path
     mount V1::Auth
end
