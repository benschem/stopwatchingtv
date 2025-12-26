# frozen_string_literal: true

# Create Activities table. Activities have a name
class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :name

      t.timestamps
    end
  end
end
