class CreateParkings < ActiveRecord::Migration[6.0]
  def change
    create_table :parkings do |t|
      t.string :plate, index: true
      t.integer :status, limit: 2
      t.timestamps
    end
  end
end
