# frozen_string_literal: true

class Mushroom < ApplicationRecord
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
