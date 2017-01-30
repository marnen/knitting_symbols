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
    export svg, format: :svg
  end

  rule(%r{^#{build_path_regex}/.*\.png$} => [-> (output_file) { output_file.pathmap('%X.svg').gsub %r{^#{build_path_regex}/}, '' }]) do |png|
    mkdir_p File.dirname(png.name)
    export png, format: :png
  end

  desc 'Build optimized SVG files'
  task optimized_svg: ['setup:path', *source_files.pathmap(File.join build_path, '%p')]

  desc 'Export to PNG'
  task png: ['setup:path', *source_files.pathmap(File.join build_path, '%X.png')]

  desc 'Export to all formats'
  task all: [:optimized_svg, :png]
end

desc 'Build HTML documentation'
task :docs do
  absolute_build_path = File.absolute_path build_path
  sh *%W[bundle exec jekyll build --config _config_docs.yml --destination #{absolute_build_path} --baseurl #{absolute_build_path}]
end

desc 'Build all files for release'
task default: ['setup:default', 'export:all', :docs]

desc 'Make a release package with specified version number'
task :release, [:version] => [:default] do |_, args|
  raise ArgumentError, 'version number is required' unless args.version
  release_path = "knitting_symbols-#{args.version}"
  File.rename build_path, release_path
  sh *%W[zip #{release_path}.zip -r #{release_path}]
end

private

def export(target, format:)
  source_path = File.absolute_path target.source
  export_path = File.absolute_path target.name

  options = case format.to_s
  when 'svg'
    [
      "--export-plain-svg=#{export_path}",
      '--export-text-to-path'
    ]
  when 'png'
    [
      "--export-png=#{export_path}",
      '--export-dpi=90'
    ]
  else
    raise ArgumentError, "Don't know how to build format #{format}. I only understand 'svg' and 'png'."
  end

  sh 'inkscape', '--without-gui', source_path, *options
end
