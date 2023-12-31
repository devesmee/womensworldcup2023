//
//  TeamItemView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct TeamItemView: View {
    let team: CountryEnum

    var body: some View {
        VStack(alignment: .center) {
            Image(team.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(team.rawValue)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100)
    }
}

#Preview {
    TeamItemView(team: .ireland)
}
