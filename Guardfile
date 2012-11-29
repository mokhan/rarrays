guard 'rspec' do
  watch(%r{^spec/specs/.+_spec\.rb$})
  watch(%r{^lib/rarrays/(.+)\.rb$})     { |m| "spec/specs/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
