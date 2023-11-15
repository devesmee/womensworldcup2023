//
//  ToolbarProfileButtonView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct ToolbarProfileButtonView: View {
    var body: some View {
        Button(action: {}, label: {
            NavigationLink(destination: ProfileOverviewView()) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        })
    }
}

#Preview {
    ToolbarProfileButtonView()
}
