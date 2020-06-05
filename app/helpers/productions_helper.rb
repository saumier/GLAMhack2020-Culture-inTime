module ProductionsHelper

  require 'digest/md5'

  def production_image(production)
    if production.main_image.blank?
      color = Digest::MD5.hexdigest(production.label)[0..5]
      "https://dummyimage.com/300x200/#{color}/ffffff.png&text=#{production.label}"
    else
      production.main_image
    end
  end
end
