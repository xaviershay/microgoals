class Initial < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :activity, null: false
      t.decimal :target, null: false
      t.timestamps null: false
    end
  end
end
