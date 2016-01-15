require 'test_helper'

class OffersHelperTest < ActionController::TestCase
  include OffersHelper
  include ActionView::Helpers::UrlHelper

  test 'offer_url with empty url' do
    offer_with_empty_url = Offer.new
    assert_equal(offer_url(offer_with_empty_url), I18n.t('offer.not_url'))
  end

  test 'offer_url with not empty url' do
    offer_with_url = Offer.new(url: 'http://www.test.sk', offer_source: offer_sources(:local))

    assert_dom_equal offer_url(offer_with_url), (link_to offer_with_url.offer_source.name,
                                                         url_with_protocol(offer_with_url.url),
                                                         target: '_blank')
  end
end