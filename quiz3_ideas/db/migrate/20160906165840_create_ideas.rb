class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body

      t.timestamps
      # creates two timestamp fields: created_at and updated_at
    end
  end
end
