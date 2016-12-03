class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
