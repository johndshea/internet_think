class CreateCuriosities < ActiveRecord::Migration
  def change
    create_table :curiosities do |t|
      t.string :title
      t.text :description
      
      t.timestamps null: false
    end
  end
end
