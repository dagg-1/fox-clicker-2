//
//  ContentView.swift
//  app
//
//  Created by Dagg on 9/5/19.
//  Copyright © 2019 Dagg. All rights reserved.
//

import SwiftUI

var points : Int64 = 0

struct BuyableList: View {
    var FoxVar = ""
    var FoxVarPhrase = ""
    @State var FoxVarNumber : Int64 = 0
    @State var FoxVarInc : Double
    @State var FoxVarCost : Double
    
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
                        if(points > Int64(self.FoxVarCost)) {
                            self.FoxVarNumber += 1
                            points -= Int64(self.FoxVarCost)
                            self.FoxVarCost *= self.FoxVarInc
                        }
                    }) {
                        Text("\(FoxVarPhrase)")
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    @State var content: Int64 = points
    var body: some View {
        HStack {
            List() {
                BuyableList(FoxVar: "Fox Farm", FoxVarPhrase: "Plant", FoxVarInc: 1.02, FoxVarCost: Double(100))
                BuyableList(FoxVar: "Fox Factory", FoxVarPhrase: "Build", FoxVarInc: 1.08, FoxVarCost: Double(200))
            }
            Divider()
            VStack {
                Button(action: { points += 1; print(points) }) {
                    Text("Spawn Fox")
                }
                Text("\(content) Points")
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
