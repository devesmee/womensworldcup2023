//
//  ToolbarFavouriteButton.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct ToolbarFavouriteButton: View {
    var body: some View {
        Button(action: {
            // TODO: add to favourites
            // TODO: if favourited, filled heart
            // TODO: if not, empty heart
        }, label: {
            Image(systemName: "heart")
                .resizable()
                .frame(width: 28, height: 28)
        })
    }
}

#Preview {
    ToolbarFavouriteButton()
}
