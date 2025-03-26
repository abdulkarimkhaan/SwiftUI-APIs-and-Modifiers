//
//  PlanetCardView.swift
//  EcommerceApplicationThemes
//
//  Created by Abdul Karim Khan on 03/04/2024.
//

import SwiftUI

struct PlanetCardView: View {
    
    var planet: Planet
    
    var body: some View {
        ZStack {
            VStack (spacing: -70) {
                Image(planet.image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .zIndex(1.0)
                    .shadow(color: .blue.opacity(0.6), radius: 20)
                VStack (alignment: .leading, spacing: 14) {
                    Text(planet.name)
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                    Text(planet.description)
                        .lineSpacing(6.0)
                        .zIndex(2.0)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 70)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                Image("ic-more-details")
                    .resizable()
                    .frame(width: 70, height: 140)
                    .zIndex(1.0)
            }
            HStack {
                Spacer()
                Text("\(planet.index)")
                    .font(.system(size: 160))
                    .bold()
                    .padding(.trailing, 20)
                    .opacity(0.1)
            }
        }
        .background(.clear)
    }
}

