class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.references :category, null: false, foreign_key: true
      #t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
