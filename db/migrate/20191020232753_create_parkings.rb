class CreateParkings < ActiveRecord::Migration[6.0]
  def change
    create_table :parkings do |t|
      t.string :plate, index: true
      t.integer :status, limit: 2
      t.boolean :paid, default: false
      t.datetime :finished_at
      t.timestamps
    end
  end
end
