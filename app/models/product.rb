class Product < ApplicationRecord
  include Fae::BaseModelConcern

  belongs_to :supplier

  has_fae_image :hero_image

  validates :title, uniqueness: true, presence: true
  validates :price, presence: true

  def fae_display_field
    title
  end
end
