class Map < ApplicationRecord
  acts_as_paranoid

  belongs_to :world
  
  has_one_attached :background
  has_one_attached :foreground
  has_one_attached :collision_mask

  belongs_to :left, class_name: 'Map', foreign_key: 'left_id', optional: true
  belongs_to :right, class_name: 'Map', foreign_key: 'right_id', optional: true
  belongs_to :top, class_name: 'Map', foreign_key: 'top_id', optional: true
  belongs_to :bottom, class_name: 'Map', foreign_key: 'bottom_id', optional: true

  def destroy
    self.deleted_at = Time.now
    save!
  end

  def deep_clone
    clone = self.dup
    clone.set_signature
    clone.background = self.background.blob
    clone.foreground = self.foreground.blob
    clone.collision_mask = self.collision_mask.blob
    clone
  end

  def set_left(map)
    return unless map.right.present?
    self.left = map
    map.right = self
  end

  def set_top(map)
    return unless map.bottom.present?
    self.top = map
    map.bottom = self
  end

  def set_signature(signature = nil)
    if signature.nil?
        signature = SecureRandom.uuid
    end

    self.signature = signature
  end
end
