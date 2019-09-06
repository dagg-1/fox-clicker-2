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
                                    case "Fox Printer":
                                        points += 10
                                        break
                                    case "Fox Matter Fabricator":
                                        points += 20
                                        break
                                    case "Fox Mass Cloner":
                                        points += 50
                                        break
                                    case "International Fox Operations":
                                        points += 150
                                        break
                                    case "Lunar Fox Mines":
                                        points += 500
                                        break
                                    case "Fox Planet Shipments":
                                        points += 2000
                                        break
                                    default:
                                        // Having a default case is explictly required.
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
                    thatclass.BuyableList(FoxVar: "Fox Farm", FoxVarPhrase: "Plant", FoxVarInc: 1.02, FoxVarCost: 100.0, FoxVarTimer: 2)
                    thatclass.BuyableList(FoxVar: "Fox Factory", FoxVarPhrase: "Build", FoxVarInc: 1.08, FoxVarCost: 200.0, FoxVarTimer: 3)
                    thatclass.BuyableList(FoxVar: "Fox Printer", FoxVarPhrase: "Buy", FoxVarInc: 1.2, FoxVarCost: 300.0, FoxVarTimer: 2)
                    thatclass.BuyableList(FoxVar: "Fox Matter Fabricator", FoxVarPhrase: "Create", FoxVarInc: 2.0, FoxVarCost: 500.0, FoxVarTimer: 1)
                    thatclass.BuyableList(FoxVar: "Fox Mass Cloner", FoxVarPhrase: "Build", FoxVarInc: 2.0, FoxVarCost: 2000.0, FoxVarTimer: 1)
                    thatclass.BuyableList(FoxVar: "International Fox Operations", FoxVarPhrase: "Negotiate", FoxVarInc: 5.0, FoxVarCost: 5000.00, FoxVarTimer: 10)
                    thatclass.BuyableList(FoxVar: "Lunar Fox Mines", FoxVarPhrase: "Build", FoxVarInc: 8.0, FoxVarCost: 50000.0, FoxVarTimer: 15)
                    thatclass.BuyableList(FoxVar: "Fox Planet Shipments", FoxVarPhrase: "Ship", FoxVarInc: 10.0, FoxVarCost: 100000.0, FoxVarTimer: 20)
                }
                Divider().padding(.top).padding(.bottom)
                VStack {
                    Button(action: {
                        points += 1
                        if (points == 1) {
                            self.updater()
                        }
                    }) {
                        Text("Spawn Fox")
                    }
                    Divider()
                        .padding(.leading).padding(.trailing)
                    Text("\(content) Foxes")
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
