# frozen_string_literal: true

require 'rake/testtask'
require 'pry'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task default: :test
