module App
  module V1
    module Entities
      class Product < Grape::Entity
        expose :name, :price
        expose :category, using: App::V1::Entities::Category
      end
    end
  end
end
