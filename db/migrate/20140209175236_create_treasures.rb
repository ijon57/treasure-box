class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.references :user
      t.string :name
      t.timestamps
    end
  end
end
