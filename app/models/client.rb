class Client < ApplicationRecord
  include Fae::BaseModelConcern

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
