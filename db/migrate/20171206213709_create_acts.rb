class CreateActs < ActiveRecord::Migration[5.1]
  def change
    create_table :acts do |t|
      t.integer :number

      t.timestamps
    end
  end
end
