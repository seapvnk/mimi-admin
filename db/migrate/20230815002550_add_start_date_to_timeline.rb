class AddStartDateToTimeline < ActiveRecord::Migration[7.0]
  def change
    add_column :timelines, :start_date, :date
  end
end
