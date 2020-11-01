# frozen_string_literal: true

require 'spec_helper'
require 'tempfile'

describe Group do
  subject { described_class.new(logs) }

  describe '#by_page' do
    let(:logs) do
      [
        ['/help_page/1', '126.318.035.038'],
        ['/contact', '184.123.665.067'],
        ['/help_page/1', '929.398.951.889']
      ]
    end

    it 'returns a desc sorted array with pages and number of views' do
      expect(subject.by_page).to eq([
                                      ['/help_page/1', 2],
                                      ['/contact', 1]
                                    ])
    end
  end

  describe '#by_page_unique_visitors' do
    let(:logs) do
      [
        ['/help', '184.123.665.067'],
        ['/help_page/1', '126.318.035.038'],
        ['/help_page/1', '929.398.951.889'],
        ['/help_page/1', '126.318.035.038']
      ]
    end

    it 'returns a desc sorted array with pages and number of unique visitors' do
      expect(subject.by_page_unique_visitors).to eq([
                                                      ['/help_page/1', 2],
                                                      ['/help', 1]
                                                    ])
    end
  end
end
