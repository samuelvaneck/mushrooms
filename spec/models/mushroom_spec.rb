# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mushroom, type: :model do
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
end
