# knitting_symbols
SVG images of standard stitch symbols used on knitting charts. The primary goal at the moment is to provide SVG images for Japanese kniting symbols, as defined in the JIS L0201 standard and commonly used in Japanese publications. However, I hope to eventually have symbols for other common systems, and contributions are aways welcome!

These images are made available under the [MIT License](https://opensource.org/licenses/MIT). Although the terms of the license do not require it, I would be delighted if you credit me (Marnen Laibow-Koser, marnen at marnen dot org) or provide a link to http://www.github.com/marnen/knitting_symbols if you use these images.

[Current list of symbols](symbols)

## Getting the images

While you can use the SVG images as they appear in the code repository, I don't advise doing so: the SVG files are optimized for editing, not file size, and some files may contain text in nonstandard fonts. Instead, I recommend using the release versions of the SVG files, which are smaller and have all text converted to paths.

The release directory also contains local copies of the HTML documents that list the symbols, so you'll always know what images you have.

### Downloading release packages

This is the easier option for most people: just download a release from the [releases page](https://github.com/marnen/knitting_symbols/releases), unzip it, and have fun!

### Building your own release files

You'll need [Ruby](http://www.ruby-lang.org) and [Inkscape](http://www.inkscape.org) installed for this. I've only tried building on Mac OS X, but the build process should work on any other Unix-like system. It may need modification to work on Windows; if so, please let me know.

Once you've installed Ruby, install the [Bundler](http://www.bundler.io) gem by typing `gem install bundler` at the command line. Then navigate to the root directory of the project and type `bundle install` to install all the other Ruby gems that are required for this project.

Now you can type `bundle exec rake` to build all the SVG images and HTML documentation into the `build` directory. If you only want to build part of that, you may want to type `bundle exec rake -T` to list the other build tasks that are available.

## Drawing the symbols: Dimensions

Using [one of Pierrot’s patterns](http://www.gosyo.co.jp/img/acrobat/216w/08-1.pdf) as a reference, I found that the stitch boxes have approximately the following dimensions (pixels are set at 90 dpi):

<dl>
  <dt>Width</dt> <dd>9.5 px</dd>
  <dt>Height</dt> <dd>7.33 px</dd>
  <dt>Left and right margins</dt> <dd>2 px, or a little more</dd>
  <dt>Top and bottom margins</dt> <dd>variable, 1–1.4 px</dd>
  <dt>Symbol line weight</dt> <dd>0.6 px</dd>
</dl>

This means that the symbols themselves tend to be about 5.5 px wide and 4.5–5.5 px high.

Multiplying all those dimensions by 6 to remove fractions, we get the following. 1 unit here is 1/(90 * 6) = 1/540 inch, or just under 0.05 mm.
<dl>
  <dt>Width</dt> <dd>57 units</dd>
  <dt>Height</dt> <dd>44 units</dd>
  <dt>Left and right margins</dt> <dd>12 units</dd>
  <dt>Top and bottom margins</dt> <dd>6–8.4 units</dd>
  <dt>Symbol width (within box)</dt> <dd>33 units</dd>
  <dt>Symbol height</dt> <dd>27–33 units</dd>
  <dt>Symbol line weight</dt> <dd>3.6 units</dd>
</dl>

The JIS symbols in this collection will be designed to something like these (very approximate) dimensions. In particular, for ease of manipulation, the margin guides in JIS/template.svg actually outline an area that’s 36 units square, not 33. However, these guides should not be taken too strictly; the Japanese symbols are quite variable in size.

Also, if we were to make our symbols the same size as the ones in the printed reference pattern, then their default rendering in HTML would be far too small. So we are drawing our symbols at triple size (28.5 by 22 pixels) for ease of Web rendering; of course, it is easy enough to scale them to other sizes as desired.
