describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( Vote.new ).to eq(true)
      end
    end
  end
end