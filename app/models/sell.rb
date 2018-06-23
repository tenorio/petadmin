class Sell < ApplicationRecord
  include Fae::BaseModelConcern

  before_save :set_total

  belongs_to :discount
  belongs_to :client

  has_many :sell_products, dependent: :destroy
  has_many :products, through: :sell_products

  has_many :sell_services, dependent: :destroy
  has_many :services, through: :sell_services

  validates :client, presence: true

  enum status: { finished: 0, canceled: 1 }

  def fae_display_field
    id
  end

  def self.for_fae_index
    order("id DESC")
  end

  private

  def set_total
    total = 0

    self.products.each { |p| total += p.price }
    self.services.each { |s| total += s.price }

    total = total - self.discount.value if self.discount.present?
    total = 0 if total < 0

    self.total = total
  end
end
