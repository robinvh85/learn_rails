module App
  module V2
    class Hello < Grape::API
      version 'v2', using: :path

      namespace :hello do
        desc 'Get sample API hello'
        get do
          { hello: 'Hello world 2' }
        end
      end
    end
  end
end
