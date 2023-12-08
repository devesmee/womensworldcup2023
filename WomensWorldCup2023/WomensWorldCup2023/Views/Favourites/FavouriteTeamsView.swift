//
//  FavouriteTeamsView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct FavouriteTeamsView: View {
    let teams: [CountryEnum]

    var body: some View {
        VStack {
            HStack {
                Text("Teams")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding([.top, .leading])
            
            VStack {
                ForEach(teams, id: \.rawValue) { team in
                    TeamRowView(team: team)
                        .padding([.top, .leading])
                }
            }
            .padding(.bottom)
        }
        .foregroundColor(Color("Yellow"))
        .background(Color("Green"))
    }
}

#Preview {
    let teams: [CountryEnum] = [.england, .germany, .netherlands, .spain]
    
    return FavouriteTeamsView(teams: teams)
}