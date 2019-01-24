class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :chatroom, null: false, default: 0, foreign_key: true
      t.references :user, null: false, default: 0, foreign_key: true

      t.timestamps
    end
  end
end
