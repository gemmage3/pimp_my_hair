class AddSoldToHairs < ActiveRecord::Migration[5.2]
  def change
    add_column :hairs, :sold, :boolean, default: false
  end
end
