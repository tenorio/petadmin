class Client < ApplicationRecord
  include Fae::BaseModelConcern

  has_many :campaign_clients, dependent: :destroy
  has_many :campaigns, through: :campaign_clients

  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true,
            format: {
                with: Fae.validation_helpers.email_regex,
                message: 'You need to use a valid and unique e-mail.'
            }

  def fae_display_field
    name
  end
end
