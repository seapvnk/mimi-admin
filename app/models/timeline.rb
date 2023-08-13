class Timeline < ApplicationRecord
    belongs_to :parent, class_name: "Timeline", optional: true
    has_many :children, class_name: "Timeline", foreign_key: "parent_id"

    has_many :worlds, class_name: "World", foreign_key: "timeline_id", inverse_of: :timeline
end
