class AddCategories < ActiveRecord::Migration[5.1]
  def up
    Category.create(name: 'Trouser')
    Category.create(name: 'Shirt')
    Category.create(name: 'Shoes')
  end

  def down
    Category.delete_all
  end
end
