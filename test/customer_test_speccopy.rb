require_relative 'player'

describe Player do

  before do
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
  end
  
  it "has a capitalized name" do
    @player.name.should == "Larry"
  end
  
  it "has an initial health" do  
    @player.health.should == 150
  end
  
  it "has a string representation" do  
    @player.to_s.should == "I'm Larry with a health of 150 and a score of 155."
  end
  
  it "computes a score as the sum of its health and length of name" do    
    @player.score.should == (150 + 5)
  end
  
  it "increases health by 15 when w00ted" do
    @player.w00t
    
    @player.health.should == @initial_health + 15
  end
  
  it "decreases health by 10 when blammed" do
    @player.blam
    
    @player.health.should == @initial_health - 10
  end
  
  context "created with a default health" do
    before do
      @player = Player.new("larry")
    end
    
    it "has a health of 100" do
      @player.health.should == 100
    end
  end
  
  context "with a health greater than 100" do
    before do
      @player = Player.new("larry", 150)
    end
  
    it "is strong" do
      @player.should be_strong
    end
  end

  context "with a health of 100 or less" do
    before do
      @player = Player.new("larry", 100)
    end
  
    it "is wimpy" do
      @player.should_not be_strong
    end
  end
  
end


#require 'spec_helper'

# RSpec.describe "SalesEngine customers" do

#   describe "Searching" do

#     describe ".random" do
#       it "usually returns different things on subsequent calls" do
#         customer_one = engine.customer_repository.random
#         customer_two = engine.customer_repository.random

#         10.times do
#           break if customer_one.id != customer_two.id
#           customer_two = engine.customer_repository.random
#         end

#         expect(customer_one.id).to_not eq customer_two.id
#       end
#     end

#     describe ".find_by_last_name" do
#       it "finds a record" do
#         customer = engine.customer_repository.find_by_last_name "Ullrich"
#         expect(%w(Ramon Brice Annabell)).to include customer.first_name
#       end
#     end

#     describe ".find_all_by_first_name" do
#       it "can find multiple records" do
#         customers = engine.customer_repository.find_all_by_first_name "Sasha"
#         expect(customers.size).to eq 2
#       end
#     end

#   end

#   context "Relationships" do
#     let(:customer) { engine.customer_repository.find_by_id 999 }

#     describe "#invoices" do
#       it "returns all of a customer's invoices" do
#         expect(customer.invoices.size).to eq 7
#       end

#       it "returns invoices belonging to the customer" do
#         customer.invoices.each do |invoice|
#           expect(invoice.customer_id).to eq 999
#         end
#       end
#     end
#   end

#   context "Business Intelligence" do
#     let(:customer) { engine.customer_repository.find_by_id 2 }

#     describe "#transactions" do
#       it "returns a list of transactions the customer has had" do
#         expect(customer.transactions.size).to eq 1
#       end
#     end

#     describe "#favorite_merchant" do
#       it "returns the merchant where the customer has had the most transactions" do
#         expect(customer.favorite_merchant.name).to eq "Shields, Hirthe and Smith"
#       end
#     end
#   end
# end

