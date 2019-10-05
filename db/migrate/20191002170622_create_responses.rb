class CreateResponses < ActiveRecord::Migration[5.2]
  def up
    create_table :responses do |t|
      t.time :hour
      t.string :timezone

      t.timestamps
    end
  end
end
