class World < ApplicationRecord
    belongs_to :timeline

    before_create :generate_signature_uuid

    private

    def generate_signature_uuid
        self.signature = SecureRandom.uuid
    end
end
