module App
  class Root < Grape::API
    mount App::V1::Hello
    mount App::V2::Hello

    mount App::V1::ProductApi
  end
end
