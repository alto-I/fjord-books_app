# frozen_string_literal: true

class ChangeColumnUseridToComments < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :user_id, :integer, null: false
  end
end
