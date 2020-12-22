module CmsEngine
  class PublicKey < ApplicationRecord
    ALGORITHMS = %w[RS512]

    validates :algorithm, inclusion: { in: ALGORITHMS }
    validates :body, presence: true

  end
end
