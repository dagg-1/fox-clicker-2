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
    var body: some View {
        VStack {
            Button(action: { self.points += 1 }) {
                Text("Click Me")
            }
            Text("\(points) Clicks")
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
