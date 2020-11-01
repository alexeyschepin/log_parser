# frozen_string_literal: true

require 'spec_helper'

describe App do
  subject { described_class.new(file) }

  describe '#run' do
    context 'no file' do
      let(:file) { nil }

      it 'raises an error' do
        expect { subject.run }.to raise_error(ArgumentError, 'file is missing')
      end
    end

    context 'valid file' do
      let(:file) do
        t = Tempfile.new('log')
        t.puts '/help 184.123.665.067'
        t.puts '/help_page/1 126.318.035.038'
        t.puts '/help_page/1 929.398.951.889'
        t.puts '/help_page/1 126.318.035.038'
        t.flush
      end
      let(:visits_desc) { 'list of webpages with most page views ordered from most pages views to less page views' }

      it 'prints log stats' do
        expect($stdout).to receive(:puts).with(visits_desc)
        expect($stdout).to receive(:puts).with('/help_page/1 3 visits')
        expect($stdout).to receive(:puts).with('/help 1 visits')
        expect($stdout).to receive(:puts).with(no_args)
        expect($stdout).to receive(:puts).with('list of webpages with most unique page views also ordered')
        expect($stdout).to receive(:puts).with('/help_page/1 2 unique views')
        expect($stdout).to receive(:puts).with('/help 1 unique views')

        subject.run
      end
    end
  end
end
