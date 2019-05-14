# knitting_symbols
SVG and PNG images of standard stitch symbols used on knitting charts. The primary goal at the moment is to provide high-quality images for Japanese kniting symbols, as defined in the JIS L0201 standard and commonly used in Japanese publications. However, I hope to eventually have symbols for other common systems, and contributions are aways welcome!

These images are made available under the [MIT License](https://opensource.org/licenses/MIT). Although the terms of the license do not require it, I would be delighted if you credit me (Marnen Laibow-Koser, marnen at marnen dot org) or provide a link to http://www.github.com/marnen/knitting_symbols if you use these images.

[Current list of symbols](symbols)

## Using the images

The easiest way to use these images is to download a release package from the [releases page](https://github.com/marnen/knitting_symbols/releases), unzip it, and have fun! The release package also contains local copies of the HTML documents that list the symbols, so you'll always know what images you have.

If the available release packages aren't suitable for you, you can [build your own release package](#building-your-own-release-package). Most people won't need to do this, but if you need it, it's easy to do.

Failing that, you can use the SVG images straight from the code repository, but I don't advise doing so: those files are optimized for easy editing, not file size, and some files may contain text in nonstandard fonts, so they may display improperly. The SVG files in the release packages are smaller and have all text converted to paths for reliable display.  (The PNG images aren't contained in the repository at all; rather, they're converted from SVG as part of the build process.)

### Building your own release package

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

Also, if we were to make our symbols the same size as the ones in the printed reference pattern, then their default rendering in HTML would be far too small. So we are drawing our symbols at triple size (29 by 22 pixels) for ease of Web rendering; of course, it is easy enough to scale them to other sizes as desired.

**N.B.!** The 90 dpi figure was used for historical reasons, but SVG 2, Inkscape, and all browser implementations [now assume 96 dpi, not 90](https://inkscape.org/learn/faq/#dpi_change). We are keeping the pixels the same, which won't affect screen display, but if you're using these for print, be aware that you may have to scale by 16/15 (108.3333%) to maintain the size of the original reference pattern.
