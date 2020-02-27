class CreateHairs < ActiveRecord::Migration[5.2]
  def change
    create_table :hairs do |t|
      t.references :user, foreign_key: true
      t.string :ethnicity
      t.integer :weight_grams
      t.integer :length_cm
      t.float :price
      t.string :hair_type
      t.string :colour

      t.timestamps
    end
  end
end
