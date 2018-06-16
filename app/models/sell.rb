class Sell < ApplicationRecord
  include Fae::BaseModelConcern
  belongs_to :discount
  belongs_to :client

  enum status: { finished: 0, canceled: 1 }

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end
end
