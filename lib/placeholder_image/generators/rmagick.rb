require 'RMagick'
require 'rvg/rvg'

module PlaceholderImage
  module Generators
    class RMagick

      def self.generate(options)
        # background
        rvg = ::Magick::RVG.new(options[:width], options[:height]).viewbox(0, 0, options[:width], options[:height]) do |canvas|
          canvas.background_fill = options[:background_color]
        end
        image = rvg.draw

        # text
        draw = ::Magick::Draw.new
        draw.pointsize = options[:width] / options[:text_scale_factor]
        draw.fill = options[:text_color]
        draw.gravity = ::Magick::CenterGravity
        draw.annotate(image, 0, 0, 0, 0, options[:text])

        image.format = options[:format]

        image
      end

    end
  end
end