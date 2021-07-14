class Product < ApplicationRecord
  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true, length: {
    minimum: 10,
    message: I18n.t('errors.models.product.attributes.title.short')
  }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
