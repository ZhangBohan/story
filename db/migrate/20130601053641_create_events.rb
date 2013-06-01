class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :repeat
      t.date :effect_at
      t.string :img_url
      t.boolean :visible

      t.timestamps
    end
  end
end
