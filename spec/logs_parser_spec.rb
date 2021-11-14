# frozen_string_literal: true

require 'date'
require_relative 'spec_helper'
require_relative '../app/logs_parser'

RSpec.describe LogsParser do
  subject { described_class.new(filename: 'webserver_test.log') }

  it 'parses input' do
    expect(subject.call).to eq([
                                 ["/index", { display_amount: 3, ips: %w[184.123.665.067 444.701.448.104 929.398.951.889] }],
                                 ['/help_page/1', { display_amount: 2, ips: %w[126.318.035.038 929.398.951.889] }]
                               ])
  end
end
