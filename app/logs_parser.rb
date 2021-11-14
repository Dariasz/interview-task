# frozen_string_literal: true

# Hash structure
# {
#   page_path: {
#     ips: 0,
#     display_amount: 0
#   }
# }

class LogsParser
  attr_reader :filename
  attr_accessor :collection

  def initialize(filename: )
    @filename = filename
    @collection = Hash.new(Hash.new)
  end

  def call
    convert_file_lines
    collection.sort_by { |_, v| -v[:display_amount] }
  end

  def convert_file_lines
    File.foreach(filename) do |line|
      values = line.split(" ")
      page = values.first
      ip = values.last

      ips = collection[page][:ips] || []
      next if ips.include?(ip)

      ips.push(ip)

      collection[page] = { ips: ips, display_amount: ips.length }
    end
  end
end