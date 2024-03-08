//
//  GroupView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 04/08/2023.
//

import SwiftUI

struct GroupView: View {
    let group: Group
    var body: some View {
        VStack {
            HStack {
                Text(group.groupName.fullText())
                    .font(.title2)
                    .bold()
                Spacer()
            }
            Grid {
                GridRow {
                    Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    // Matches played
                    Text("MP")
                        .font(.title3)
                    // Goal difference
                    Text("GD")
                        .font(.title3)
                    // Points
                    Text("Pts")
                        .bold()
                        .font(.title3)
                }
                // Team that finished first
                GroupRow(team: group.teams[0], finishedPosition: 1)
                Divider()
                // Team that finished second
                GroupRow(team: group.teams[1], finishedPosition: 2)
                Divider()
                // Team that finished third
                GroupRow(team: group.teams[2], finishedPosition: 3)
                Divider()
                // Team that finished fourth
                GroupRow(team: group.teams[3], finishedPosition: 4)
                Divider()
                HStack {
                    HStack {
                        Circle()
                            .foregroundColor(Color("Pink"))
                            .frame(width: 20, height: 20)
                        Text("To round of 16")
                            .font(.callout.italic())
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .foregroundColor(Color("Yellow"))
        .background(Color("Green"))
    }
}

#Preview {
    let exampleGroup =
    Group(
        groupName: .groupA,
        teams: [
            Country(
                country: .newZealand,
                matchesPlayed: 3,
                goalDifference: 0,
                points: 4
            ),
            Country(
                country: .norway,
                matchesPlayed: 3,
                goalDifference: 5,
                points: 4
            ),
            Country(
                country: .philippines,
                matchesPlayed: 3,
                goalDifference: -7,
                points: 3
            ),
            Country(
                country: .switzerland,
                matchesPlayed: 3,
                goalDifference: 2,
                points: 5
            )
        ]
    )

    return GroupView(group: exampleGroup)
}
