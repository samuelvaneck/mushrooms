# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mushroom, type: :model do
  let(:edible) { FactoryBot.create :mushroom, edible: true, ring_number: 'o' }
  let(:poisonous) { FactoryBot.create :mushroom, edible: false, ring_number: 'o' }
  let(:odor_almond) { FactoryBot.create :mushroom, odor: 'a', ring_number: 'o' }
  let(:odor_fishy) { FactoryBot.create :mushroom, odor: 'y', ring_number: 'o' }
  let(:odor_mutsy) { FactoryBot.create :mushroom, odor: 'm', ring_number: 'o' }
  let(:edible_brown_gill_color_two_rings) { FactoryBot.create :mushroom, edible: true, gill_color: 'n', ring_number: 't' }

  describe '#import' do
    context 'with valid data' do
      before { @file = file_fixture('test_import.data') }
      it 'imports the data' do
        expect do
          Mushroom.import(@file)
        end.to change(Mushroom, :count).by(5)
      end

      it 'returns the number of imported objects' do
        expect(Mushroom.import(@file)).to eq 5
      end

      it 'import the mushroom with correct values' do
        Mushroom.import(@file)
        mushroom = Mushroom.order(:created_at).first

        expect(mushroom.edible).to eq false
        expect(mushroom.cap_shape).to eq 'x'
        expect(mushroom.cap_surface).to eq 's'
        expect(mushroom.cap_color).to eq 'n'
        expect(mushroom.bruises).to eq true
        expect(mushroom.odor).to eq 'p'
        expect(mushroom.gill_attachment).to eq 'f'
        expect(mushroom.gill_spacing).to eq 'c'
        expect(mushroom.gill_size).to eq 'n'
        expect(mushroom.gill_color).to eq 'k'
        expect(mushroom.stalk_shape).to eq 'e'
        expect(mushroom.stalk_root).to eq 'e'
        expect(mushroom.stalk_surface_above_ring).to eq 's'
        expect(mushroom.stalk_surface_below_ring).to eq 's'
        expect(mushroom.stalk_color_above_ring).to eq 'w'
        expect(mushroom.stalk_color_below_ring).to eq 'w'
        expect(mushroom.veil_type).to eq 'p'
        expect(mushroom.veil_color).to eq 'w'
        expect(mushroom.ring_number).to eq 'o'
        expect(mushroom.ring_type).to eq 'p'
        expect(mushroom.spore_print_color_range).to eq 'k'
        expect(mushroom.population).to eq 's'
        expect(mushroom.habitat).to eq 'u'
      end
    end
  end

  describe '#filter_by' do
    context 'when filtering on editable mushrooms' do
      before do
        edible
        poisonous
      end
      it 'returns only the edible mushrooms' do
        expect(Mushroom.filter_by({ edible: 1 })).to contain_exactly edible
      end
    end

    context 'when filtering on multiple values' do
      before do
        odor_almond
        odor_fishy
        odor_mutsy
      end
      it 'returns all the mushrooms that match the values' do
        expect(Mushroom.filter_by({ odor: ['a', 'y'] })).to contain_exactly odor_almond, odor_fishy
      end
    end

    context 'when filtering on edible, brown gill-color and two rings' do
      before do
        edible
        poisonous
        odor_almond
        odor_fishy
        odor_mutsy
        edible_brown_gill_color_two_rings
      end
      it 'returns the mushrooms that match the filter' do
        filter = { edible: true, gill_color: 'n', ring_number: 't' }
        expect(Mushroom.filter_by(filter)).to contain_exactly edible_brown_gill_color_two_rings
      end
    end
  end
end
