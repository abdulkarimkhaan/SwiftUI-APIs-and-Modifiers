//
//  CustomTipKit.swift
//  SwiftUI Useful Components
//
//  Created by Abdul Karim Khan on 16.03.25.
//

import TipKit

struct CustomTipViewStyle: TipViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    configuration.title?
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    configuration.message?
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                HStack (spacing: 10) {
                    Spacer()
                    Button("Dismiss") {
                        print("Dismiss")
                    }
                    .foregroundStyle(.white)
                    .buttonStyle(.borderedProminent)
                    Button("Challenge") {
                        print("Challenge")
                    }
                    .foregroundStyle(.white)
                    .buttonStyle(.borderedProminent)

                }
            }
        }
        .padding()
        .cornerRadius(10)
        .background(.cyan)
        .shadow(radius: 2) 
    }
}
