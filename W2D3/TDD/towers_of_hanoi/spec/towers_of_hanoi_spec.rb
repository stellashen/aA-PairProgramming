require 'towers_of_hanoi'


describe TowersOfHanoi do
  subject(:unplayed_game) { TowersOfHanoi.new }
  subject(:winning_game) { TowersOfHanoi.new([[], [3, 2, 1], []]) }

  describe "#initialize" do
    arr = [[3, 2, 1], [], []]
    it "creates a default set of towers if none are given" do
      expect(unplayed_game.towers).to eq(arr)
    end

    it "sets towers equal to the value passed" do
      arr = [[], [3, 2, 1], []]
      expect(winning_game.towers).to eq(arr)
    end
  end
end
