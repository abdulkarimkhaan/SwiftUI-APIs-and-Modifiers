//
//  Tips.swift
//  SwiftUI Useful Components
//
//  Created by Abdul Karim Khan on 15.03.25.
//

import TipKit
import SwiftUI

struct CompetitionTip: Tip {
    @Parameter
    static var alreadyDiscovered: Bool = false
    
    var title: Text {
        Text("Challenge Your Friends!")
    }
    
    var message: Text? {
        Text("See who's online and compete with them in real time. Ready to test your skills?")
    }
    
    var image: Image? {
        Image("ic-comp-mode-tip")
    }
    
    var actions: [Action] {
        Action(title: "Check out who is leading!")
    }
    
    var options: [TipOption] {
        [MaxDisplayCount(5)] // Ensure it can be shown multiple times
    }
    
    var rules: [Rule] {[
        #Rule(Self.$alreadyDiscovered) { $0 == false }
    ]}
    
}

struct PlanetDetailsTip: Tip {
    
    var title: Text {
        Text("Did You Know?")
    }
    
    var message: Text? {
        Text("Want to see how planets compare in size? Check out the interactive planet scale feature!")
    }
    
//    var actions: [Action] {
//        Action(title: "Check out who is leading!")
//    }
    
//    var options: [TipOption] {
//        [MaxDisplayCount(5)] // Ensure it can be shown multiple times
//    }
    
}


