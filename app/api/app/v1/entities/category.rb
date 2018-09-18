module App
  module V1
    module Entities
      class Category < Grape::Entity
        expose :name
      end
    end
  end
end
