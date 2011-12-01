# -*- encoding: utf-8 -*-
module PlaceholderImage

  autoload :VERSION,    'placeholder_image/version'
  autoload :Generator,  'placeholder_image/generator'

  module Generators
    autoload :RMagick,  'placeholder_image/generators/rmagick'
  end
end
