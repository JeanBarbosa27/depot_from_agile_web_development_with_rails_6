require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test 'product price must be positive' do
    product = Product.new(
      title: 'My book title',
      description: 'A pretty interesting book description',
      image_url: 'an_image_name.jpg'
    )

    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(
      title: 'My book title',
      description: 'A nice book description',
      image_url: image_url,
      price: 1
    )
  end

  test 'product must have a valid image url' do
    ok = %w[fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif]
    bad = %w[fred.doc fred.gif/more fred.gif.more]

    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} shouldn't be invalid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end

  test 'product is not valid without a unique title' do
    product = Product.new(
      title: products(:ruby).title,
      description: 'A nice description',
      image_url: 'fred.gif',
      price: 1
    )

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  test 'product title must have at least 10 characters' do
    product = Product.new(
      title: 'small one',
      description: products(:one).description,
      image_url: products(:one).image_url,
      price: products(:one).price
    )

    assert product.invalid?
    assert_equal [I18n.t('errors.models.product.attributes.title.short')], product.errors[:title]
  end

end
