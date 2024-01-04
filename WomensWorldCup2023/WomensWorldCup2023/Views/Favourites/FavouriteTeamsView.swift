//
//  FavouriteTeamsView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct FavouriteTeamsView: View {
    let teams: [CountryEnum]
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Teams")
                    .font(.title2)
                    .bold()
                Spacer()
                Button {
                    expandContent()
                } label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(
                            width: 12,
                            height: 18
                        )
                        .rotationEffect(isExpanded ? Angle(degrees: 90) : Angle(degrees: 0))
                        .foregroundColor(Color("Yellow"))
                }
            }
            .contentShape(Rectangle())
            .padding(.all)
            .onTapGesture {
                expandContent()
            }

            if isExpanded {
                VStack {
                    if teams.isEmpty {
                        Text("You have no favourite stadiums yet.")
                    } else {
                        ForEach(teams, id: \.rawValue) { team in
                            TeamRowView(team: team)
                                .padding([.top, .leading])
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .foregroundColor(Color("Yellow"))
        .background(Color("Green"))
    }

    private func expandContent() {
        withAnimation {
            isExpanded.toggle()
        }
    }
}

#Preview {
    let teams: [CountryEnum] = [.england, .germany, .netherlands, .spain]

    return FavouriteTeamsView(teams: teams)
}
