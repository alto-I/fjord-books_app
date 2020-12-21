# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string, null: false, default: ''
    add_column :users, :postal_code, :string, null: false, default: ''
    add_column :users, :address, :string, null: false, default: ''
    add_column :users, :introduce_yourself, :text, null: false, default: ''
  end
end
