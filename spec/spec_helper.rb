# -*- encoding: utf-8 -*-
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/spec'
require 'minitest/pride'
require 'minitest/matchers'
require 'tempfile'

require 'placeholder_image'

# References:
#   - MiniMagick: https://github.com/probablycorey/mini_magick/blob/master/test/image_test.rb
#   - ChunkyPNG: https://github.com/wvanbergen/chunky_png/blob/master/spec/chunky_png/color_spec.rb
#   - RMagick: http://www.imagemagick.org/RMagick/doc/draw.html

module Kernel
  # Suppresses warnings within a given block.
  def with_warnings_suppressed
    saved_verbosity = $-v
    $-v = nil
    yield
  ensure
    $-v = saved_verbosity
  end
end

module PlaceholderImage
  module SpecHelpers
    module RMagick

      def open_image(path)
        ::Magick::ImageList.new(path).flatten_images
      end

      def colors(image)
        pixels = {}

        image.each_pixel do |pixel, c, r|
          # RMagick's API just kills me...
          color = pixel.to_color(compliance=::Magick::AllCompliance, matte=true, depth=8, hex=true)

          if pixels[color]
            pixels[color] += 1
          else
            pixels[color] = 1
          end
        end

        pixels.sort_by { |k,v| v }.reverse.map { |v| v[0].downcase }
      end

      def background_color(image)
        colors(image)[0]
      end

      def text_color(image)
        colors(image)[1]
      end

      def dimensions(image)
        [image.columns, image.rows]
      end

      def format(image)
        image.format.downcase
      end

      def fixture_image(filename)
        filename = File.join(File.dirname(__FILE__), 'fixtures', filename)
        open_image(filename)
      end

    end
  end
end
