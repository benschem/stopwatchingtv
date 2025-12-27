# frozen_string_literal: true

# Uniqueness validation should have a unique index on the database column.
class AddUniqueIndexToNameOnActivities < ActiveRecord::Migration[8.0]
  def change
    add_index :activities, :name, unique: true
  end
end
