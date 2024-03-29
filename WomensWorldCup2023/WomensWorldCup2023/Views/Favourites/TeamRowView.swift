//
//  TeamRowView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 15/11/2023.
//

import SwiftUI

struct TeamRowView: View {
    let team: CountryEnum

    var body: some View {
        HStack {
            HStack {
                Image(team.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(team.rawValue)
                    .bold()
            }
            Spacer()
        }
        .background(Color("Green"))
    }
}

#Preview {
    TeamRowView(team: CountryEnum.netherlands)
}
