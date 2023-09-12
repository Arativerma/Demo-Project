class Dropteacherstable < ActiveRecord::Migration[6.1]
  def change
    drop_table :teachers, if_exists: true
  end
end
