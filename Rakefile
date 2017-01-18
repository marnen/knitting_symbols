require 'os'

source_files = FileList['JIS/**/*.svg']
build_path = 'build'
build_path_regex = Regexp.escape build_path

namespace :setup do
  task :path do
    ENV['PATH'] += ':/Applications/Inkscape.app/Contents/Resources/bin' if OS.mac?
  end

  task default: :path
end

desc 'Optimize SVG file and convert text to paths'
rule(%r{^#{build_path_regex}/.*\.svg$} => [-> (output_file) { output_file.gsub %r{^#{build_path_regex}/}, '' }]) do |svg|
  mkdir_p File.dirname(svg.name)
  sh *%W[inkscape --without-gui --export-plain-svg=#{File.absolute_path svg.name} --export-text-to-path #{File.absolute_path svg.source}]
end

task optimize_svg: ['setup:path', *source_files.pathmap(File.join build_path, '%p')]

desc 'Build optimized SVG files for release'
task default: ['setup:default', :optimize_svg]
