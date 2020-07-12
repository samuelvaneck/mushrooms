# frozen_string_literal: true

class Mushroom < ApplicationRecord

  CAP_SHAPE = { b: 'bell', c: 'conical', x: 'convex', f: 'flat', k: 'knobbed', s:'sunken' }.freeze
  CAP_SURFACE = { f: 'fibrous', g: 'grooves', y: 'scaly', s: 'smooth' }.freeze
  CAP_COLOR = { n: 'brown', b: 'buff', c: 'cinnamon', g: 'gray', r: 'green', p: 'pink', u: 'purple', e: 'red', w: 'white', y: 'yellow' }.freeze
  BRUISES = { t: 'bruises', f: 'no' }.freeze
  ODOR = { a: 'almond', l: 'anise', c: 'creosote', y: 'fishy', f: 'foul', m: 'musty', n: 'none', p: 'pungent', s: 'spicy' }.freeze
  GILL_ATTACHMENT = { a: 'attached', d: 'descending', f: 'free', n: 'notched' }.freeze
  GILL_SPACING = { c: 'close', w: 'crowded', d: 'distant' }.freeze
  GILL_SIZE = { b: 'broad', n: 'narrow' }.freeze
  GILL_COLOR = { k: 'black', n: 'brown', b: 'buff', h: 'chocolate', g: 'gray', r: 'green', o: 'orange', p: 'pink', u: 'purple', e: 'red', w: 'white', y: 'yellow' }.freeze
  STALK_SHAPE = { e: 'enlarging', t: 'tapering' }.freeze
  STALK_ROOT = { b: 'bulbous', c: 'club', u: 'cup', e: 'equal', z: 'rhizomorphs', r: 'rooted', '?': 'missing' }.freeze
  STALK_SURFACE_ABOVE_RING = { f: 'fibrous', y: 'scaly', k: 'silky', s: 'smooth' }.freeze
  STALK_SURFACE_BELOW_RING = { f: 'fibrous', y: 'scaly', k: 'silky', s: 'smooth' }.freeze
  STALK_COLOR_ABOVE_RING = { n: 'brown', b: 'buff', c: 'cinnamon', g: 'gray', o: 'orange', p: 'pink', e: 'red', w: 'white', y: 'yellow' }.freeze
  STALK_COLOR_BELOW_RING = { n: 'brown', b: 'buff', c: 'cinnamon', g: 'gray', o: 'orange', p: 'pink', e: 'red', w: 'white', y: 'yellow' }.freeze
  VEIL_TYPE = { p: 'partial', u: 'universal' }.freeze
  VEIL_COLOR = { n: 'brown', o: 'orange', w: 'white', y: 'yellow' }.freeze
  RING_NUMBER = { n: 'none', o: 'one', t: 'two' }.freeze
  RING_TYPE = { c: 'cobwebby', e: 'evanescent', f: 'flaring', l: 'large', n: ' none', p: 'pendant', s: 'sheathing', z: 'zone' }.freeze
  SPORE_PRINT_COLOR_RANGE = { k: 'black', n: 'brown', b: 'buff', h: 'chocolate', r: 'green', o: 'orange', u: 'purple', w: 'white', y: 'yellow' }.freeze
  POPULATION = { a: 'abundant', c: 'clustered', n: 'numerous', s: 'scattered', v: 'several', y: 'solitary' }.freeze
  HABITAT = { g: 'grasses', l: 'leaves', m: 'meadows', p: 'paths', u: 'urban', w: 'waste', d: 'woods' }.freeze

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
