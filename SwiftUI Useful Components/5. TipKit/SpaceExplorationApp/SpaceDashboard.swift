//
//  SpaceDashboard.swift
//  SwiftUIAppThemes
//
//  Created by Abdul Karim Khan on 03/04/2024.
//

import SwiftUI
import TipKit

struct SpaceDashboard: View {
    
    let model = SpaceDashboardModel()
//    var competitionTip = CompetitionTip()
//    var planetDetailTip = PlanetDetailsTip()
//
    var tipGroup = TipGroup(.ordered) {
        CompetitionTip()
        PlanetDetailsTip()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    VStack (spacing: -10) {
                        HStack {
                            Image("ic-side-menu")
                                .resizable()
                                .frame(width: 40, height: 80)
                            Spacer()
                            Image("ic-my-profile")
                                .resizable()
                                .frame(width: 40, height: 80)
                        }
                        VStack {
                            Text("Space")
                                .font(.system(size: 50))
                                .foregroundStyle(.white)
                                .bold()
                            Text("Chronicles")
                                .font(.system(size: 40))
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView (.horizontal) {
                        LazyHStack {
                            ForEach(model.getData(), id: \.self) { planet in
                                NavigationLink {
                                    PlanetDetailsView(planet: planet)
                                } label: {
                                    PlanetCardView(planet: planet)
                                        .padding(.horizontal)
                                        .frame(width: 270)
                                        .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                            content
                                                .opacity(phase.isIdentity ? 1.0 : 0.8)
                                                .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                        }
                                        .frame(width: geometry.size.width/1.5)
                                        .frame(minHeight: geometry.size.height)
                                        .frame(alignment: .center)
//                                        .popoverTip(planetDetailTip)
                                        .popoverTip(planet.index == 2 ? tipGroup.currentTip as? PlanetDetailsTip : nil) // Show tip only on second view

                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .frame(alignment: .center)
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                    .padding(.top, 20)
                    
                    VStack(spacing: 4) {
                        HStack(spacing: -8) {
                            ForEach(1...4, id: \.self) { index in
                                Image("ic-profile-\(index)")
                                    .resizable()
                                    .frame(width: 40, height: 80)
                            }
                        }
                        Text("Abdul, Karim and Khan are online")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
//                    .popoverTip(competitionTip)
//                    .tipViewStyle(CustomTipViewStyle())
                    .popoverTip(tipGroup.currentTip as? CompetitionTip) { _ in
                        CompetitionTip.alreadyDiscovered = true
                    }
                    
                }
                .background(Image("ic-space").resizable().ignoresSafeArea())
            }
        }
    }
}

#Preview {
    SpaceDashboard()
}
