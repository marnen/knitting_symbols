#!ruby
require 'bigdecimal'
require 'nokogiri'

NEW_WIDTH = 29
PRECISION = 8
VIEW_FACTOR = 3

def move_g!(g, x: 0, y: 0)
  translate = [BigDecimal.new(x, PRECISION) / VIEW_FACTOR, BigDecimal.new(y, PRECISION) / VIEW_FACTOR]
  translate_string = "translate(#{translate.map {|value| value.to_s 'f'}.join ','})"
  g['transform'] = [g['transform'], translate_string].compact.join ' '
end

def move_grid!(grid, x: 0, y: 0)
  old_x = BigDecimal.new(grid['originx'])
  old_y = BigDecimal.new(grid['originy'])
  new_x = old_x + (x / VIEW_FACTOR)
  new_y = old_y + (y / VIEW_FACTOR)
  grid['originx'] = new_x.to_s('f')
  grid['originy'] = new_y.to_s('f')
end

def move_guide!(guide, x: 0, y: 0)
  old_x, old_y = guide['position'].split(',').map {|value| BigDecimal.new value }
  new_x = old_x + (x / VIEW_FACTOR)
  new_y = old_y + (y / VIEW_FACTOR)
  guide['position'] = [new_x.to_s('f'), new_y.to_s('f')].join ','
end

def view_box(root)
  width = BigDecimal.new(root['width']) / VIEW_FACTOR
  height = BigDecimal.new(root['height']) / VIEW_FACTOR
  [0, 0, width.to_s('f'), height.to_s('f')].join ' '
end

string = $stdin.read
svg = Nokogiri::XML string
root = svg.at_css 'svg'
root['width'] = NEW_WIDTH
root['viewBox'] = view_box(root)

move_grid! svg.at_css('inkscape|grid'), x: 0.25
vertical_guides = svg.css 'sodipodi|guide[orientation="1,0"]'
vertical_guides.each do |guide|
  move_guide! guide, x: 0.25
end

gs = svg.css 'g'
gs.each do |g|
  move_g! g, x: 0.25
end
puts svg
