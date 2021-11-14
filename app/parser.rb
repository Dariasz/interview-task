#!/usr/bin/ruby

require_relative 'logs_parser'

collection = LogsParser.new(filename: ARGV.first).call
collection.each { |k, v| puts "#{k} #{v[:display_amount]} unique views" }
