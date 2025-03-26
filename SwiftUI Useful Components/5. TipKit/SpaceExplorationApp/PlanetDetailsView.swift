//
//  PlanetDetailsView.swift
//  EcommerceApplicationThemes
//
//  Created by Abdul Karim Khan on 06/04/2024.
//

import SwiftUI

struct PlanetDetailsView: View {
    
    var planet: Planet
    @Environment(\.presentationMode) var presentationMode
    @State var onAppear = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .top){
                HStack (alignment: .top) {
                    Image("ic-back")
                        .resizable()
                        .frame(width: 50, height: 100)
                        .padding()
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                HStack {
                    VStack {
                        Spacer()
                        Text("\(planet.index)")
                            .font(.system(size: 180))
                            .bold()
                            .opacity(0.1)
                            .padding(.leading, 30)
                    }
                    Spacer()
                }
                Image(planet.image)
                    .resizable()
                    .frame(width: 500, height: 500)
                    .padding(.top, -150)
                    .padding(.trailing, -270)
                    .zIndex(3.0)
                    .shadow(radius: 10)
                    .scaleEffect(onAppear ? 1 : 0)
                    .animation(.easeInOut(duration: 2), value: onAppear)
            }
            .frame(height: 360)
            VStack(alignment: .leading, spacing: 16) {
                Text(planet.name)
                    .font(.system(size: 50))
                    .bold()
                Text(planet.longDescription)
                    .font(.system(size: 18))
                    .lineSpacing(5.0)
                    .zIndex(2.0)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            Spacer()
            //MARK: Add your video here
            ZStack {
                Image("ic-thumbnail")
                    .resizable()
                    .frame(height: 195)
                    .clipShape(RoundedRectangle(cornerRadius: 40.0))
                    .padding(.horizontal, 30)
                    .opacity(0.9)
                    .zIndex(1.0)
                    .shadow(color: .blue, radius: 20)
                Image("ic-play")
                    .resizable()
                    .frame(width: 160, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 40.0))
                    .padding(.horizontal, 30)
                    .zIndex(3.0)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            onAppear = true
        }
    }
}



//#Preview {
//    PlanetDetailsView(planet: Planet(image: "ic-mercury", name: "Earth", description: "Earth has 75% of water and 25% of land. It is suitable for living organism. Earth has 75% of water and 25% of land. It is suitable for living organism", longDescription: "", video: ""))
//}
