module App
  class Root < Grape::API
    prefix :api

    mount App::V1::Hello
    mount App::V2::Hello

    mount App::V1::ProductApi
  end
end
