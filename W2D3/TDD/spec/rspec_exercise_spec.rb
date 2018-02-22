require 'rspec_exercise'

describe Array do
  subject(:arr) { Array.new }

  describe "#my_unique" do
    it "returns empty array if input is empty array" do
      expect(arr.my_unique).to eq([])
    end

    it "returns itself if passed array has a length of 1" do
      arr << 1
      expect(arr.my_unique).to eq([1])
    end

    it "returns non-duplicated elements if passed array has length > 1" do
      [8, 1, 3, 3, 4, 5].each do |num|
        arr << num
      end
      expect(arr.my_unique).to eq([8, 1, 3, 4, 5])
    end
  end

  describe "#two_sum" do
    context "when there are no pairs that sum to zero" do
      arr = [1, 2, 3]
      it "returns empty array" do
        expect(arr.two_sum).to eq([])
      end
    end

    context "when there are pairs that sum to zero" do
      arr = [-1, 3, 5, 7, 1, -5]
      # it "returns correct pairs" do
      #   expect(arr.two_sum).to include([0, 4])
      #   expect(arr.two_sum).to include([2, 5])
      # end

      it "returns pairs in correct order (e.g. [[0, 2], [1, 5]])" do
        expect(arr.two_sum).to eq(arr.two_sum.sort)
      end

      it "ensures that the smaller element in a pair comes first" do
        res = arr.two_sum
        res.each do |pair|
          expect(pair.length).to eq(2)
          expect(pair[0] <= pair[1]).to be true
        end
      end
    end
  end

  describe "#my_transpose" do
    it "transposes the matrix" do
      arr = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      result = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]
      expect(arr.my_transpose).to eq(result)
    end
  end

  describe "#stock_picker" do

    arr = [2000, 100, 500, 200]
    res = arr.stock_picker

    it "buys the stock at the lowest price" do
      expect(res[0]).to eq(1)
    end

    it "sells the stock at the highest price" do
      expect(res[1]).to eq(2)
    end
  end
end
