class CreateNothings < ActiveRecord::Migration[5.0]
  def change
    create_table :nothings do |t|
      t.string :name

      t.timestamps
    end
  end
end
