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

namespace :export do
  desc 'Optimize SVG file and convert text to paths'
  rule(%r{^#{build_path_regex}/.*\.svg$} => [-> (output_file) { output_file.gsub %r{^#{build_path_regex}/}, '' }]) do |svg|
    mkdir_p File.dirname(svg.name)
    sh *%W[inkscape --without-gui --export-plain-svg=#{File.absolute_path svg.name} --export-text-to-path #{File.absolute_path svg.source}]
  end

  desc 'Build optimized SVG files'
  task optimize_svg: ['setup:path', *source_files.pathmap(File.join build_path, '%p')]

  desc 'Export to all formats'
  task all: :optimize_svg
end

desc 'Build HTML documentation'
task :docs do
  absolute_build_path = File.absolute_path build_path
  sh *%W[bundle exec jekyll build --config _config_docs.yml --destination #{absolute_build_path} --baseurl #{absolute_build_path}]
end

desc 'Build all files for release'
task default: ['setup:default', 'export:optimize_svg', :docs]

desc 'Make a release package with specified version number'
task :release, [:version] => [:default] do |_, args|
  raise ArgumentError, 'version number is required' unless args.version
  release_path = "knitting_symbols-#{args.version}"
  File.rename build_path, release_path
  sh *%W[zip #{release_path}.zip -r #{release_path}]
end
