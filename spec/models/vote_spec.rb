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

  describe 'after_save' do
    it "calls `Post#update_rank` after save" do
      post = create(:post)
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end

