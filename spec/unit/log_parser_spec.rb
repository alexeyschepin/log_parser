# frozen_string_literal: true

require 'spec_helper'
require 'tempfile'

describe LogParser do
  subject { described_class.perform(file) }

  context 'file cannot be open' do
    let(:file) { 'invalid/path' }

    it 'raises an error' do
      expect { subject }.to raise_error(Errno::ENOENT, "No such file or directory @ rb_sysopen - #{file}")
    end
  end

  context 'file has valid format' do
    let(:file) do
      t = Tempfile.new('log')
      t.puts '/help_page/1 126.318.035.038'
      t.puts 'contact 184.123.665.067'
      t.flush
    end

    it 'parses and returns a file content in hash format' do
      expect(subject).to eq([
                              ['/help_page/1', '126.318.035.038'],
                              ['contact', '184.123.665.067']
                            ])
    end
  end
end
