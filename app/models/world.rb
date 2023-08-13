class World < ApplicationRecord
    belongs_to :timeline

    def set_signature(signature = nil)
        if signature.nil?
            signature = SecureRandom.uuid
        end

        self.signature = signature
    end
end
