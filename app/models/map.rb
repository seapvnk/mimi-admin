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

  def set_signature(signature = nil)
    if signature.nil?
        signature = SecureRandom.uuid
    end

    self.signature = signature
  end
end
