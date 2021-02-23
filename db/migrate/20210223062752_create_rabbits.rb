# frozen_string_literal: true

class CreateRabbits < ActiveRecord::Migration[6.1]
  def change
    create_table :rabbits do |t|
      t.string :name
      t.timestamps
    end
  end
end
