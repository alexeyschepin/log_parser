# frozen_string_literal: true

require 'spec_helper'

describe Render do
  subject { described_class }

  let(:page_visits) do
    [
      ['/help_page/1', 3],
      ['/contact', 1]
    ]
  end
  let(:page_unique_visitors) do
    [
      ['/help_page/1', 2],
      ['/help', 1]
    ]
  end

  describe '.print_page_visits' do
    let(:description) { 'list of webpages with most page views ordered from most pages views to less page views' }

    it 'prints page visits with description' do
      expect($stdout).to receive(:puts).with(description)
      expect($stdout).to receive(:puts).with('/help_page/1 3 visits')
      expect($stdout).to receive(:puts).with('/contact 1 visits')

      described_class.print_page_visits(page_visits)
    end
  end

  describe '.print_page_unique_visitors' do
    it 'prints page unique visitors with description' do
      expect($stdout).to receive(:puts).with('list of webpages with most unique page views also ordered')
      expect($stdout).to receive(:puts).with('/help_page/1 2 unique views')
      expect($stdout).to receive(:puts).with('/help 1 unique views')

      described_class.print_page_unique_visitors(page_unique_visitors)
    end
  end

  describe '.print' do
    it 'prints page visits and page unique visitors' do
      expect(described_class).to receive(:print_page_visits).with(page_visits)
      expect($stdout).to receive(:puts)
      expect(described_class).to receive(:print_page_unique_visitors).with(page_unique_visitors)

      described_class.print(page_visits, page_unique_visitors)
    end
  end
end
