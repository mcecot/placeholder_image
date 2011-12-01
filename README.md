# PLACEHOLDER_IMAGE [![](https://secure.travis-ci.org/merchii/placeholder_image.png)](http://travis-ci.org/merchii/placeholder_image)

*Generate generic placeholder vector images - just like placehold.it, but native.*

## Dependencies

* **[rmagick](https://github.com/rmagick/rmagick)** - for now, plan to optionally replace it with [mini_magick](https://github.com/probablycorey/mini_magick) when I "get" the API well enough.
* **[commander](https://github.com/visionmedia/commander)** - for command-line support.

## Usage

Command-line:

```shell
$ placeholder_image 150x100 /tmp/placeholder.png
$ placeholder_image 300x300 /tmp/placeholder.png --text "Hello" --bgcolor "#dddddd" --color "#bbbbbb"
```

Code:

```ruby
generator = PlaceholderImage::Generator.new('150x100')
generator.generate!("/tmp/placeholder.png")

generator = PlaceholderImage::Generator.new('300x300', background_color: "#dddddd", text_color: "#bbbbbb")
generator.generate!("/tmp/placeholder.png")
```

## Options

Command-line:

```shell
$ placeholder_image help generate
```

Code:

* `background_color` - render background using this color. Default: `'#000000'`.
* `text_color` - render text using this color. Default: `'#ffffff'`.
* `text` - the text rendered centered within the image. Default: `'#{WIDTH} x #{HEIGHT}'`.

## Notes

This gem was developed for our own requirements at **[Merchii](http://github.com/merchii)**, so feel free to send pull-requests with enhancements of any kind (features, bug-fixes, documentation, tests, etc.) to make it better or useful for you as well.

## License

Released under the MIT license.

Copyright (c) [Jonas Grimfelt](http://github.com/grimen), [Merchii](http://github.com/merchii)