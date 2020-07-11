# frozen_string_literal: true

FactoryBot.define do
  factory :mushroom do
    edible { Faker::Boolean.boolean }
    cap_shape { ['b', 'c', 'x', 'f', 'k', 's'].sample }
    cap_surface { ['f', 'g', 'y', 's'].sample }
    cap_color { ['n', 'b', 'c', 'g', 'r', 'p', 'u', 'e',  'w', 'y'].sample }
    bruises { Faker::Boolean.boolean }
    odor { ['a', 'l', 'c', 'y', 'f', 'm', 'n', 'p', 's'].sample }
    gill_attachment { ['a', 'd', 'f', 'n'].sample }
    gill_spacing { ['c', 'w', 'd'].sample }
    gill_size { ['b', 'n'].sample }
    gill_color { ['k', 'n', 'b', 'h', 'g',  'r', 'o', 'p', 'u', 'e',  'w', 'y'].sample }
    stalk_shape { ['e', 't'].sample }
    stalk_root { ['b', 'c', 'u', 'e', 'z', 'r', '?'].sample }
    stalk_surface_above_ring { ['f', 'y', 'k', 's'].sample }
    stalk_surface_below_ring { ['f', 'y', 'k', 's'].sample }
    stalk_color_above_ring { ['n', 'b', 'c', 'g', 'o', 'p', 'e', 'w', 'y'].sample }
    stalk_color_below_ring { ['n', 'b', 'c', 'g', 'o', 'p', 'e', 'w', 'y'].sample }
    veil_type { ['p', 'u'].sample }
    veil_color { ['n', 'o', 'w', 'y'].sample }
    ring_number { ['n', 'o', 't'].sample }
    ring_type { ['c', 'e', 'f', 'l', 'n', 'p', 's', 'z'].sample }
    spore_print_color_range { ['k', 'n', 'b', 'h', 'r', 'o', 'u', 'w', 'y'].sample }
    population { ['a', 'c', 'n', 's', 'v', 'y'].sample }
    habitat { ['g', 'l', 'm', 'p', 'u', 'w', 'd'].sample }
  end
end
