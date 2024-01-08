//
//  TeamItemView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct TeamItemView: View {
    let countryName: String

    var body: some View {
        VStack(alignment: .center) {
            Image(countryName)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(countryName)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100)
    }
}

#Preview {
    TeamItemView(countryName: "Netherlands")
}
