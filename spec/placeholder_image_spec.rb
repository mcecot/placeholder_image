require 'spec_helper'


describe ::PlaceholderImage do

  include ::PlaceholderImage::SpecHelpers::RMagick

  describe "VERSION" do
    it 'should be defined' do
      defined?(::PlaceholderImage::VERSION)
    end

    it 'should be a valid version string (e.g. "0.0.1", or "0.0.1.rc1")' do
      valid_version_string = /^\d+\.\d+\.\d+/
      ::PlaceholderImage::VERSION.must_match valid_version_string
    end
  end

  describe ::PlaceholderImage::Generator do
    before(:each) do
      @image_path = '/tmp/placeholder.png'
    end

    describe '#generate!' do
      describe "format" do
        it "should generate image as PNG image" do
          generator = PlaceholderImage::Generator.new('150x100')
          generator.generate!(@image_path)
          image = open_image(@image_path)

          format(image).must_equal 'png'
        end
      end

      describe "dimensions" do
        it "should require width/height arguments" do
          # Don't get the MiniTest usage... :S
          # proc { PlaceholderImage::Generator.new }.must_throw ArgumentError
        end

        it "should generate image with correct width/height using arguments" do
          generator = PlaceholderImage::Generator.new('150x100')
          generator.generate!(@image_path)
          image = open_image(@image_path)

          dimensions(image).must_equal [150, 100]
        end
      end

      describe "background color" do
        it "should generate image with 'gray' as background color - unless specified" do
          generator = PlaceholderImage::Generator.new('150x100')
          generator.generate!(@image_path)
          image = open_image(@image_path)

          background_color(image).must_equal '#000000'
        end

        it "should generate image with specified background color - if specified" do
          generator = PlaceholderImage::Generator.new('150x100', :background_color => '#ff0000')
          generator.generate!(@image_path)
          image = open_image(@image_path)

          background_color(image).must_equal '#ff0000'
        end
      end

      # DANGER ZONE: More of a experiment testing text/font... *<:D

      describe "text color" do
        it "should generate image with 'white' as text color - unless specified" do
          generator = PlaceholderImage::Generator.new('150x100')
          generator.generate!(@image_path)
          image = open_image(@image_path)

          text_color(image).must_equal '#ffffff'
        end

        it "should generate image with specified text color - if specified" do
          generator = PlaceholderImage::Generator.new('150x100', :text_color => '#ff0000')
          generator.generate!(@image_path)
          image = open_image(@image_path)

          text_color(image).must_equal '#ff0000'
        end
      end

      describe "text" do
        it "should generate image with '<WIDTH>x<HEIGHT>' as text- unless specified" do
          skip
          # generator = PlaceholderImage::Generator.new('150x100')
          # generator.generate!(@image_path)
          # image = open_image(@image_path)
          #
          # bitmap(image).must_equal bitmap(fixture_image("/path/to/fixture"))
        end

        it "should generate image with specified text - if specified" do
          skip
          # generator = PlaceholderImage::Generator.new('150x100', :text => "#WIN")
          # generator.generate!(@image_path)
          # image = open_image(@image_path)
          #
          # bitmap(image).must_equal bitmap(fixture_image("/path/to/fixture"))
        end

        it "should generate image with no text if specified string is blank (i.e. non-nil, but zero-length)" do
          skip
          # generator = PlaceholderImage::Generator.new('150x100', :text => "")
          # generator.generate!(@image_path)
          # image = open_image(@image_path)
          #
          # bitmap(image).must_equal bitmap(fixture_image("/path/to/fixture"))
        end
      end
    end

    describe "font" do
      it "should generate image with 'Arial' as font - unless specified" do
        skip
        # generator = PlaceholderImage::Generator.new('150x100')
        # generator.generate!(@image_path)
        # image = open_image(@image_path)
        #
        # bitmap(image).must_equal bitmap(fixture_image("/path/to/fixture"))
      end

      it "should generate image with specified text color - if specified" do
        skip
        # generator = PlaceholderImage::Generator.new('150x100', :font => 'verdana')
        # generator.generate!(@image_path)
        # image = open_image(@image_path)
        #
        # bitmap(image).must_equal bitmap(fixture_image("/path/to/fixture"))
      end
    end
  end

end
