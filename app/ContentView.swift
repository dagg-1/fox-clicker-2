//
//  ContentView.swift
//  app
//
//  Created by Dagg on 9/5/19.
//  Copyright © 2019 Dagg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var points = 0
    @State var FarmAmount = 0
    var body: some View {
        HStack {
            List(0..<5) { item in
                Text("Fox Farm")
                Button(action: { self.FarmAmount += 1 }) {
                    Text("Plant")
                }
                Text("\(self.FarmAmount)")
            }
            VStack {
                Button(action: { self.points += 1 }) {
                    Text("Spawn Fox")
                }
                Text("\(points) Points")
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
