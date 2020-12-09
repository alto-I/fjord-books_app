# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :introduce_yourself, :text
  end
end
