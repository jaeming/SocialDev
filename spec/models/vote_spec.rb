require 'rails_helper'

describe Vote do
  before do
    @vote = Vote.new(value: 1)
  end
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @vote.valid? ).to eq(true)
      end
    end
  end
end