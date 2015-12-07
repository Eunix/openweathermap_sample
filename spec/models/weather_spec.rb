require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe 'weather methods' do
    context 'with correct city name' do
      before do
        allow(subject).to receive(:openweathermap).and_return(
          JSON.load(File.read('spec/fixtures/openweathermap1.json'))
        )
      end

      it 'returns temperature' do
        expect(subject.temperature).to eq(3.15)    
      end

      it 'returns humidity' do
        expect(subject.humidity).to eq(87)   
      end

      it 'returns pressure' do
        expect(subject.pressure).to eq(989.94)   
      end

      it 'returns wind' do
        expect(subject.wind).to eq(9.76)   
      end

      it 'returns clouds' do
        expect(subject.clouds).to eq(80)   
      end
    end

    context 'with incorrect city name' do
      before do
        allow(subject).to receive(:openweathermap).and_return([])
      end

      it 'returns empty temperature' do
        expect(subject.temperature).to be nil
      end
    end
  end

  describe '.fetched?' do
    it 'returns false w/o temperature' do
      expect(subject.fetched?).to be false
    end

    it 'returns true if temperature exists' do
      allow(subject).to receive(:temperature).and_return(12)
      expect(subject.fetched?).to be true
    end
  end
end
