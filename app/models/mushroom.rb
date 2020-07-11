# frozen_string_literal: true

class Mushroom < ApplicationRecord
  def self.import(file)
    counter = 0
    File.open(file).each do |line|
      mushroom = Mushroom.new(
        edible: line[0] == 'e',
        cap_shape: line[1],
        cap_surface: line[2],
        cap_color: line[3],
        bruises: line[4] == 't',
        odor: line[5],
        gill_attachment: line[6],
        gill_spacing: line[7],
        gill_size: line[8],
        gill_color: line[9],
        stalk_shape: line[10],
        stalk_root: line[11],
        stalk_surface_above_ring: line[12],
        stalk_surface_below_ring: line[13],
        stalk_color_above_ring: line[14],
        stalk_color_below_ring: line[15],
        veil_type: line[16],
        veil_color: line[17],
        ring_number: line[18],
        ring_type: line[19],
        spore_print_color_range: line[20],
        population: line[21],
        habitat: line[22]
      )

      counter += 1 if mushroom.save
    end

    counter
  end
end
