require 'rails_helper'
require 'json'
require_relative '../app/helpers/articles_helper.rb'

describe ArticlesHelper do
  describe ".parse_json" do
    context "using test data" do
      it "returns valid hash" do
        response = File.read("spec/test_data.json")

        result = Hash.new
        result = ArticlesHelper::parse_json(response)

        count = result.length

        for index in 0..count-1 do
          expect(result[index][:id]).to eq(index)
          expect(result[index][:auction_id]).to eq(index)
          expect(result[index][:currency]).to eq("EUR")
          expect(result[index][:reserve_met]).not_to be true
          expect(result[index][:estimate]).to eq(0)
          expect(result[index][:next_bid_amount]).to eq(1)
          expect(result[index][:state]).to eq("published")
          expect(result[index][:title]).to eq("Test title")
          expect(result[index][:description]).to eq("Test description")
          expect(result[index][:condition]).to eq("No remarks.")
          expect(result[index][:company_id]).to eq(index)
          expect(result[index][:category_id]).to eq(index)
          expect(result[index][:ends_at]).to eq(1000000000)
          expect(result[index][:published_at]).to eq(100)
          expect(result[index][:type]).to eq("online")
          expect(result[index][:location]).to eq("Salzburg")
          expect(result[index][:house]).to eq("Test house")
          expect(result[index][:placement]).to eq("test placement")
          expect(result[index][:url]).to include('https://')
          expect(result[index][:transport_price]).to eq("From 0 EUR")
          expect(result[index][:images]).to be_kind_of(Array)
          expect(result[index][:images][0][:thumb]).to eq("thumb.jpg")
          expect(result[index][:images][0][:mini]).to eq("mini.jpg")
          expect(result[index][:images][0][:w200]).to eq("w200.jpg")
          expect(result[index][:images][0][:w640]).to eq("w640.jpg")
          expect(result[index][:images][0][:hd]).to eq("hd.jpg")
          expect(result[index][:bids]).to be_kind_of(Array)
          expect(result[index][:bids][0][:bidder]).to eq(1)
          expect(result[index][:bids][0][:color]).to eq("#000000")
          expect(result[index][:bids][0][:amount]).to eq(0)
          expect(result[index][:bids][0][:your_bid]).to be false
          expect(result[index][:bids][0][:reserve_met]).to be true
          expect(result[index][:bids][0][:timestamp]).to eq(0)
        end
      end
    end
  end
end