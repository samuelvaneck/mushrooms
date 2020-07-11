# frozen_string_literal: true

class Mushroom < ApplicationRecord

  CAP_SHAPE = [['bell', 'b'], ['conical', 'c'], ['convex', 'x'], ['flat', 'f'], ['knobbed', 'k'], ['sunken', 's']].freeze
  CAP_SURFACE = [['fibrous', 'f'], ['grooves', 'g'], ['scaly', 'y'], ['smooth', 's']].freeze
  CAP_COLOR = [['brown', 'n'], ['buff', 'b'] , ['cinnamon', 'c'], ['gray', 'g'], ['green', 'r'], ['pink', 'p'], ['purple', 'u'], ['red', 'e'], ['white', 'w'], ['yellow', 'y']].freeze
  BRUISES = [['bruises', 't'], ['no', 'f']].freeze
  ODOR = [['almond', 'a'], ['anise', 'l'], ['creosote', 'c'], ['fishy', 'y'], ['foul', 'f'], ['musty', 'm'], ['none', 'n'], ['pungent', 'p'], ['spicy', 's']].freeze
  GILL_ATTACHMENT = [['attached', 'a'], ['descending', 'd'], ['free', 'f'], ['notched', 'n']].freeze
  GILL_SPACING = [['close', 'c'], ['crowded', 'w'], ['distant', 'd']].freeze
  GILL_SIZE = [['broad', 'b'], ['narrow', 'n']].freeze
  GILL_COLOR = [['black', 'k'], ['brown', 'n'], ['buff', 'b'], ['chocolate', 'h'], ['gray', 'g'], ['green', 'r'], ['orange', 'o'], ['pink', 'p'], ['purple', 'u'], ['red', 'e'],  ['white', 'w'], ['yellow', 'y']].freeze
  STALK_SHAPE = [['enlarging', 'e'], ['tapering', 't']].freeze
  STALK_ROOT = [['bulbous', 'b'], ['club', 'c'], ['cup', 'u'], ['equal', 'e'], [' rhizomorphs', 'z'], ['rooted', 'r'], ['missing', '?']].freeze
  STALK_SURFACE_ABOVE_RING = [['fibrous', 'f'], ['scaly', 'y'], ['silky', 'k'], ['smooth', 's']].freeze
  STALK_SURFACE_BELOW_RING = [['fibrous', 'f'], ['scaly', 'y'], ['silky', 'k'], ['smooth', 's']].freeze
  STALK_COLOR_ABOVE_RING = [['brown', 'n'],['buff', 'b'], ['cinnamon', 'c'], ['gray', 'g'], ['orange', 'o'], ['pink', 'p'], ['red', 'e'], ['white', 'w'], ['yellow', 'y']].freeze
  STALK_COLOR_BELOW_RING = [['brown', 'n'],['buff', 'b'], ['cinnamon', 'c'], ['gray', 'g'], ['orange', 'o'], ['pink', 'p'], ['red', 'e'], ['white', 'w'], ['yellow', 'y']].freeze
  VEIL_TYPE = [['partial', 'p'], ['universal', 'u']].freeze
  VEIL_COLOR = [['brown', 'n'], ['orange', 'o'], ['white', 'w'], ['yellow', 'y']].freeze
  RING_NUMBER =[['none', 'n'], ['one', 'o'], ['two', 't']].freeze
  RING_TYPE = [['cobwebby', 'c'], ['evanescent', 'e'], ['flaring', 'f'], ['large', 'l'], [' none', 'n'], ['pendant', 'p'], ['sheathing', 's'], ['zone', 'z']].freeze
  SPORE_PRINT_COLOR_RANGE = [['black', 'k'], ['brown', 'n'], ['buff', 'b'], ['chocolate', 'h'], ['green', 'r'], ['orange', 'o'], ['purple', 'u'], ['white', 'w'], ['yellow', 'y']].freeze
  POPULATION = [['abundant', 'a'], ['clustered', 'c'], ['numerous', 'n'], [' scattered', 's'], ['several', 'v'], ['solitary', 'y']].freeze
  HABITAT = [['grasses', 'g'], ['leaves', 'l'], ['meadows', 'm'], ['paths', 'p'], ['urban', 'u'], ['waste', 'w'], ['woods', 'd']].freeze

  def self.import(file)
    counter = 0
    File.open(file).each do |line|
      m_array = line.gsub("\n", '').split(',')
      mushroom = Mushroom.new(
        edible: m_array[0] == 'e',
        cap_shape: m_array[1],
        cap_surface: m_array[2],
        cap_color: m_array[3],
        bruises: m_array[4] == 't',
        odor: m_array[5],
        gill_attachment: m_array[6],
        gill_spacing: m_array[7],
        gill_size: m_array[8],
        gill_color: m_array[9],
        stalk_shape: m_array[10],
        stalk_root: m_array[11],
        stalk_surface_above_ring: m_array[12],
        stalk_surface_below_ring: m_array[13],
        stalk_color_above_ring: m_array[14],
        stalk_color_below_ring: m_array[15],
        veil_type: m_array[16],
        veil_color: m_array[17],
        ring_number: m_array[18],
        ring_type: m_array[19],
        spore_print_color_range: m_array[20],
        population: m_array[21],
        habitat: m_array[22]
      )

      counter += 1 if mushroom.save
    end

    counter
  end
end
