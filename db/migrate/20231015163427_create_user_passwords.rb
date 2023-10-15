# frozen_string_literal: true

class CreateUserPasswords < ActiveRecord::Migration[7.1]
  def change
    create_table :user_passwords do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :password, null: false, foreign_key: true

      t.timestamps
    end
  end
end
