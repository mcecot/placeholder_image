module PlaceholderImage
  class Generator

    GENERATORS = [:rmagick]

    DEFAULT_FORMAT = 'png'
    DEFAULT_BACKGROUND_COLOR = '#000000'
    DEFAULT_TEXT_COLOR = '#ffffff'
    DEFAULT_TEXT_SCALE_FACTOR = 9
    DEFAULT_FONT = 'arial'
    DIMENSIONS_SEPERATOR = " \u00D7 "

    def initialize(dimension_string, options = {})
      unless dimension_string.to_s.strip =~ /^\d+x\d+$/
        raise ArgumentError, "Not a valid image dimension: #{dimension_string.inspect}. Expected format '100x100', etc."
      end
      dimensions = dimension_string.split('x')
      @options = options
      @options[:width] = dimensions[0].to_i
      @options[:height] = dimensions[1].to_i
      @generator = :rmagick
    end

    def generate
      case @generator
      when :rmagick
        image = PlaceholderImage::Generators::RMagick.generate(options)
      else
        raise ArgumentError, "No such generator: #{@generator.inspect}. Valid generators: #{GENERATORS.inspect}"
      end
      image
    end

    def generate!(filename)
      image = generate()
      image.write(filename)
    end

    def options
      width = @options[:width]
      height = @options[:height]
      background_color = @options[:background_color] ? @options[:background_color].to_s : DEFAULT_BACKGROUND_COLOR
      text_color = @options[:text_color] ? @options[:text_color].to_s : DEFAULT_TEXT_COLOR
      font = @options[:font] ? @options[:font].to_s : DEFAULT_FONT
      text = @options[:text] ? @options[:text].to_s : [@options[:width], @options[:height]].join(DIMENSIONS_SEPERATOR)
      text_scale_factor = DEFAULT_TEXT_SCALE_FACTOR
      format = DEFAULT_FORMAT

      {
        :width => width,
        :height => height,
        :background_color => background_color,
        :text_color => text_color,
        :font => font,
        :text => text,
        :text_scale_factor => text_scale_factor,
        :format => format
      }
    end
  end
end