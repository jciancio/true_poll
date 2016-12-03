class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :bill, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
