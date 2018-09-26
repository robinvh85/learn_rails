module App
  module V1
    module Entities
      class Product < Grape::Entity
        expose :name do |item, opt|
          "#{item.name} VH"
        end
        expose :price, if: ->(a, _) { a.price.present? }
        expose :category, using: App::V1::Entities::Category
      end
    end
  end
end
