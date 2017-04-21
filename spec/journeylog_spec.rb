require 'journey_log'

describe JourneyLog do

  let(:journey_log) { described_class.new }
  let(:journey) { double(:journey) }

  describe '#add' do

    before do
    end

    it 'records journey information' do
      journey_log.add(journey)
      expect(journey_log.history.values).to include journey
    end

  end

  describe '#number_of_journies' do

    before do
    end

    it 'returns the correct numbr of journies' do
      number = 3
      number.times do journey_log.add(journey) end
      expect(journey_log.number_of_journies).to eq number
    end

  end

end
