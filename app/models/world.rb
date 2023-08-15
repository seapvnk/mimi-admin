class World < ApplicationRecord
    acts_as_paranoid
    
    belongs_to :timeline

    has_many :maps
    
    def set_signature(signature = nil)
        if signature.nil?
            signature = SecureRandom.uuid
        end

        self.signature = signature
    end
end
