class CreateAppoints < ActiveRecord::Migration[5.0]
  def change
    create_table :appoints do |t|

      t.datetime   :start_time

      t.references :room
      t.references :user

      t.timestamps
    end
  end
end
