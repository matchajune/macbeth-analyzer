class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.text :text

      t.references :scene
      t.references :character

      t.timestamps
    end
  end
end
