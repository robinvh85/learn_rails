module App
  module V1
    class Hello < Grape::API
      version 'v1', using: :path

      namespace :hello do
        get do
          { hello: 'Hello world 1' }
        end
      end
    end
  end
end
