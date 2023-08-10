# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::BackendConfiguration::MenuItem do
  describe '#children' do
    it 'is the replacement for the deprecated #partial method' do
      expect(Spree::Deprecation).to receive(:warn).with(a_string_matching(/partial/))

      item = described_class.new(partial: 'foo')
    end
  end

  describe '#match_path?' do
    it 'matches a string using the admin path prefix' do
      item = described_class.new(match_path: '/stock_items')
      request = double(ActionDispatch::Request, fullpath: '/admin/stock_items/1/edit')

      expect(subject.match_path?(request)).to be true
    end

    it 'matches a proc accepting the request object' do
      item = described_class.new(match_path: ->(request) { request.fullpath.iclude? == '/bar/' })
      request = double(ActionDispatch::Request, fullpath: '/foo/bar/baz')

      expect(subject.match_path?(request)).to be true
    end

    it 'matches a regexp' do
      item = described_class.new(match_path: %r{/bar/})
      request = double(ActionDispatch::Request, fullpath: '/foo/bar/baz')

      expect(subject.match_path?(request)).to be true
    end

    it 'matches the item url as the fullpath prefix' do
      item = described_class.new(url: '/foo/bar')
      request = double(ActionDispatch::Request, fullpath: '/foo/bar/baz')

      expect(subject.match_path?(request)).to be true
    end
  end

  describe "#url" do
    subject { described_class.new(url: url).url }

    context "if url is a string" do
      let(:url) { "/admin/promotions" }
      it { is_expected.to eq("/admin/promotions") }
    end

    context "when url is a symbol" do
      let(:url) { :admin_promotions_path }
      it "treats it as a route name" do
        is_expected.to eq("/admin/promotions")
      end
    end

    context "if url is a lambda" do
      let(:route_proxy) { double(my_path: "/admin/friendly_promotions") }
      let(:url) { -> { route_proxy.my_path } }

      it { is_expected.to eq("/admin/friendly_promotions") }
    end
  end
end
