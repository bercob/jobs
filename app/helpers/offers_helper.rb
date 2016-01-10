module OffersHelper

  def offer_url(offer)
    if offer.url.present?
      link_to offer.offer_source.name, url_with_protocol(@offer.url), target: '_blank'
    else
      t('offer.not_url')
    end
  end


  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end
end
