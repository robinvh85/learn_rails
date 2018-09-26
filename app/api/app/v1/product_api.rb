module App
  module V1
    class ProductApi < Grape::API
      version 'v1', using: :path

      namespace :product do
        get do
          products = Product.all
          present products, with: App::V1::Entities::Product
        end
      end
    end
  end
end