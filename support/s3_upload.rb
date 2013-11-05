#!/usr/bin/env ruby

require 'dotenv'
require 'aws-sdk'

Dotenv.load

file = ARGV.first || 'build.tar.gz'
obj_name = File.basename(file)

puts "Uploading '#{Pathname.new(file)}'..."
puts "Using '#{ENV['AWS_ACCESS_KEY_ID']}' access key."

AWS.config(
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
)

s3 = AWS::S3.new

bucket = s3.buckets['heroku-buildpack-r']

obj = bucket.objects[obj_name]
obj.write(Pathname.new(file))
obj.acl = :public_read

puts "Uploaded '#{obj_name}' to S3 successfully."
