require 'spec_helper'

describe PlaceholderImage do

  describe "VERSION" do
    it 'should be defined' do
      defined?(::Rack::Iframe::VERSION)
    end

    it 'should be a valid version string (e.g. "0.0.1", or "0.0.1.rc1")' do
      valid_version_string = /^\d+\.\d+\.\d+/
      PlaceholderImage::VERSION.must_match valid_version_string
    end
  end


  describe Generator
    # TODO
  end

end