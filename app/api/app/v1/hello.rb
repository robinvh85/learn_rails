module App
  module V1
    class Hello < Grape::API
      version 'v1', using: :path

      namespace :hello do
        params do
          requires :name, type: String, regexp: /\A[a-z]+\z/
          optional :age, type: Integer
        end
        get do
          { hello: "Hello world, #{params[:name]} - Age: #{params['age']}" }
        end

        params do
          requires :name, type: String, regexp: /\A[a-z]+\z/
          optional :age, type: Integer, default: -> { Random.rand(1..100) }
        end
        get ':id' do
          {value: "#{params[:id]} - Name: #{params[:name]} - Age: #{params[:age]}"}
        end
      end
    end
  end
end
