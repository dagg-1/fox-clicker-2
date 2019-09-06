//
//  ContentView.swift
//  app
//
//  Created by Dagg on 9/5/19.
//  Copyright © 2019 Dagg. All rights reserved.
//

import SwiftUI

var points : Int64 = 0

class thatclass {
    struct BuyableList: View {
        var FoxVar = ""
        var FoxVarPhrase = ""
        @State var FoxVarNumber : Int64 = 0
        @State var FoxVarInc : Double
        @State var FoxVarCost : Double
        @State var FoxVarTimer : Int
        
        var body: some View {
            HStack {
                VStack {
                    Text("\(FoxVar)").font(.headline)
                    HStack {
                        Text("Quantity: \(FoxVarNumber)").font(.subheadline)
                        Divider()
                        Text("Cost: \(Int64(FoxVarCost))").font(.subheadline)
                        Divider()
                        Button(action: {
                            if(points >= Int64(self.FoxVarCost)) {
                                self.FoxVarNumber += 1
                                points -= Int64(self.FoxVarCost)
                                self.FoxVarCost *= self.FoxVarInc
                                Timer.scheduledTimer(withTimeInterval: Double(self.FoxVarTimer), repeats: true) {
                                    [self] _ in
                                    
                                    switch (self.FoxVar) {
                                    case "Fox Farm":
                                        points += 1
                                        break
                                    case "Fox Factory":
                                        points += 5
                                        break
                                    default:
                                        break
                                    }
                                }
                            }
                        }) {
                            Text("\(FoxVarPhrase)")
                        }
                    }
                    Divider()
                }
            }
        }
    }
    
    struct ContentView: View {
        @State var content: Int64 = points
        
        func updater() {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
                [self] _ in
                self.content = points
            }
        }

        var body: some View {
            HStack {
                List() {
                    thatclass.BuyableList(FoxVar: "Fox Farm", FoxVarPhrase: "Plant", FoxVarInc: 1.02, FoxVarCost: Double(100), FoxVarTimer: 3)
                    thatclass.BuyableList(FoxVar: "Fox Factory", FoxVarPhrase: "Build", FoxVarInc: 1.08, FoxVarCost: Double(200), FoxVarTimer: 1)
                }
                Divider()
                VStack {
                    Button(action: {
                        points += 1
                        if (points == 1) {
                            self.updater()
                        }
                    }) {
                        Text("Spawn Fox")
                    }
                    Text("\(content) Points")
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        thatclass.ContentView()
    }
}
