# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::BackendConfiguration::MenuItem do
  describe '#match_path' do
    subject do
      described_class.new(match_path: '/stock_items').match_path
    end

    it 'can be read' do
      is_expected.to eq('/stock_items')
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
