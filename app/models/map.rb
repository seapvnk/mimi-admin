class Map < ApplicationRecord
  acts_as_paranoid

  belongs_to :world
  
  has_one_attached :background
  has_one_attached :foreground
  has_one_attached :collision_mask

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


  def set_signature(signature = nil)
    if signature.nil?
        signature = SecureRandom.uuid
    end

    self.signature = signature
  end
end
