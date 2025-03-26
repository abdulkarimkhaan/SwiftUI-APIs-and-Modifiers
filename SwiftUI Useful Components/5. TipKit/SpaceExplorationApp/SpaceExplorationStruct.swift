//
//  SpaceExplorationStruct.swift
//  EcommerceApplicationThemes
//
//  Created by Abdul Karim Khan on 03/04/2024.
//

import SwiftUI

struct Planet: Hashable {
    var index: Int
    var image: String
    var name: String
    var description: String
    var longDescription: String
    var video: String
}

struct PlanetSize {
    var width: CGFloat
    var height: CGFloat
}

struct DetailView {
    var planet: Planet
    var showView: Bool
}
