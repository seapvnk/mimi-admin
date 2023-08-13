class AddTimelineIdToWorld < ActiveRecord::Migration[7.0]
  def change
    add_reference :worlds, :timeline, foreign_key: true
  end
end
