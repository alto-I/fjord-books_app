# frozen_string_literal: true

class ChengeColumnToReports < ActiveRecord::Migration[6.0]
  def change
    change_column :reports, :title, :string, null: false
    change_column :reports, :description, :text, null: false
  end
end
