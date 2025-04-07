class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreigh_key: true, null: false
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
