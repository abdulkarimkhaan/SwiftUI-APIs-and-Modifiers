//
//  SpaceDashboardModel.swift
//  SwiftUIAppThemes
//
//  Created by Abdul Karim Khan on 08/04/2024.
//

import Foundation

class SpaceDashboardModel {
    
    func getData() -> [Planet] {
        return [
            Planet(index: 1, image: "ic-mercury", name: "Mercury", description: "Tiny inferno, closest to the Sun with wild temperature swings.", longDescription: "Tiny inferno, closest to the Sun with wild temperature swings. Scorched by day, freezing by night, it has no atmosphere.", video: ""),
            Planet(index: 2, image: "ic-venus", name: "Venus", description: "Burning beauty, hottest planet with a thick, toxic atmosphere.", longDescription: "Burning beauty, hottest planet with a thick, toxic atmosphere. A runaway greenhouse effect traps heat, making it hotter than Mercury.", video: ""),
            Planet(index: 3, image: "ic-earth", name: "Earth", description: "Our oasis, the only known planet to support life with 75% of water.", longDescription: "Our oasis, the only known planet to support life. A blue marble with liquid water, diverse life forms, and a protective atmosphere.", video: ""),
            Planet(index: 4, image: "ic-mars", name: "Mars", description: "Rusty neighbor, cold and dry with a thin atmosphere and ancient water.", longDescription: "Rusty neighbor, cold and dry with a thin atmosphere and hints of ancient water. Reddish dust covers the surface, with polar ice caps and potential for past life.", video: ""),
            Planet(index: 5, image: "ic-jupiter", name: "Jupiter", description: "Giant king, swirling atmosphere with a giant storm bigger than Earth.", longDescription: "Giant king, swirling atmosphere with a giant storm bigger than Earth (Great Red Spot). Made mostly of gas, it has a strong gravity and numerous moons.", video: ""),
            Planet(index: 6, image: "ic-saturn", name: "Saturn", description: "Ringed wonder, famous for its icy rings and beautiful form.", longDescription: "Ringed wonder, famous for its stunning icy rings and beautiful form. A gas giant with a tilted axis and a complex system of moons.", video: ""),
            Planet(index: 7, image: "ic-neptune", name: "Neptune", description: "Distant wanderer, farthest planet with supersonic winds and a dark blue hue.", longDescription: "Distant wanderer, farthest planet with supersonic winds and a dark blue hue. An ice giant with the strongest winds in the solar system and a dark blue methane atmosphere.", video: ""),
            Planet(index: 8, image: "ic-pluto", name: "Pluto", description: "Icy dwarf, once a planet, cold and small with moons.", longDescription: "Icy dwarf, once a planet, cold and small with moons. A small, icy world beyond Neptune, rich in frozen nitrogen and methane, with its own moons.", video: "")
        ]
    }
}
