class World < ApplicationRecord
    acts_as_paranoid
    
    belongs_to :timeline

    has_many :maps

    def deep_clone
      clone = self.dup
      clone.set_signature

      clone.maps = self.maps.map do |map|
        map_clone = map.deep_clone
        map_clone
      end

      clone
    end
    
    def set_signature(signature = nil)
        if signature.nil?
            signature = SecureRandom.uuid
        end

        self.signature = signature
    end
end
