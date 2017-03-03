class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos do |t|
      t.string :name
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
