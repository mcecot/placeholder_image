guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'minitest' do
  watch(%r|^spec/(.*)_spec\.rb|)
  watch(%r|^lib/(.*)\.rb|)            { "spec" }
  watch(%r|^spec/spec_helper\.rb|)    { "spec" }
  watch(%r|^Gemfile\.lock|)           { "spec" }
end
