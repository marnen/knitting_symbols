# knitting_symbols
SVG images of standard stitch symbols used on knitting charts. The primary goal at the moment is to provide SVG images for Japanese kniting symbols, as defined in the JIS L0201 standard and commonly used in Japanese publications. However, I hope to eventually have symbols for other common systems, and contributions are aways welcome!

[Current list of symbols](https://marnen.github.io/knitting_symbols/symbols)

## Dimensions

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
