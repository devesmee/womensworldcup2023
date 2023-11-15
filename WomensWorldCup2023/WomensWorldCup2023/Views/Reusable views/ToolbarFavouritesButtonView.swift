//
//  ToolbarFavouritesButtonView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct ToolbarFavouritesButtonView: View {
    var body: some View {
        Button(action: {}, label: {
            NavigationLink(destination: FavouritesOverviewView()) {
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        })
    }
}

#Preview {
    ToolbarFavouritesButtonView()
}
