//
//  StadiumDetailView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 23/06/2023.
//

import SwiftData
import SwiftUI

struct StadiumDetailView: View {
    @Environment(\.modelContext) private var context
    @Query private var favouriteStadiums: [Stadium]
    let stadium: Stadium
    private var matches: [Match] {
        return stadium.matches
    }

    var body: some View {
        if favouriteStadiums.contains(where: { $0.name == stadium.name }) {
            stadium.favourited = true
        }

        return VStack(spacing: 0) {
            StadiumInfo(stadium: stadium)

            List {
                if !matches.groupStage.isEmpty {
                    Section(header: HStack {
                        Text("Group stage")
                            .font(.headline)
                            .foregroundColor(Color("Yellow"))
                            .padding()
                        Spacer()
                    }
                    .background(Color("Orange"))
                    .listRowInsets(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0))
                    ) {
                        ForEach(matches.groupStage) { match in
                            MatchListRow(
                                match: match,
                                showDate: true,
                                showTournamentStage: false,
                                backgroundColor: Color("Yellow")
                            )
                        }
                    }
                }

                if !matches.roundOf16.isEmpty {
                    Section(header: HStack {
                        Text("Round of 16")
                            .font(.headline)
                            .foregroundColor(Color("Yellow"))
                            .padding()
                        Spacer()
                    }
                        .background(Color("Red"))
                        .listRowInsets(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0))
                    ) {
                        ForEach(matches.roundOf16) { match in
                            MatchListRow(
                                match: match,
                                showDate: true,
                                showTournamentStage: false,
                                backgroundColor: Color("Yellow")
                            )
                        }
                    }
                }

                if !matches.quarterFinal.isEmpty {
                    Section(header: HStack {
                        Text("Quarter final")
                            .font(.headline)
                            .foregroundColor(Color("Yellow"))
                            .padding()
                        Spacer()
                    }
                        .background(Color("Pink"))
                        .listRowInsets(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0))
                    ) {
                        ForEach(matches.quarterFinal) { match in
                            MatchListRow(
                                match: match,
                                showDate: true,
                                showTournamentStage: false,
                                backgroundColor: Color("Yellow")
                            )
                        }
                    }
                }

                if !matches.semiFinal.isEmpty {
                    Section(header: HStack {
                        Text("Semi final")
                            .font(.headline)
                            .foregroundColor(Color("Yellow"))
                            .padding()
                        Spacer()
                    }
                        .background(Color("Blue"))
                        .listRowInsets(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0))
                    ) {
                        ForEach(matches.semiFinal) { match in
                            MatchListRow(
                                match: match,
                                showDate: true,
                                showTournamentStage: false,
                                backgroundColor: Color("Yellow")
                            )
                        }
                    }
                }

                if !matches.thirdPlace.isEmpty {
                    Section(header: HStack {
                        Text("Third place")
                            .font(.headline)
                            .foregroundColor(Color("Yellow"))
                            .padding()
                        Spacer()
                    }
                        .background(Color("Green"))
                        .listRowInsets(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0))
                    ) {
                        ForEach(matches.thirdPlace) { match in
                            MatchListRow(
                                match: match,
                                showDate: true,
                                showTournamentStage: false,
                                backgroundColor: Color("Yellow")
                            )
                        }
                    }
                }

                if !matches.final.isEmpty {
                    Section(header: HStack {
                        Text("Final")
                            .font(.headline)
                            .foregroundColor(Color("Yellow"))
                            .padding()
                        Spacer()
                    }
                        .background(Color("Orange"))
                        .listRowInsets(EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0))
                    ) {
                        ForEach(matches.final) { match in
                            MatchListRow(
                                match: match,
                                showDate: true,
                                showTournamentStage: false,
                                backgroundColor: Color("Yellow")
                            )
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .background(Color("Yellow"))
            .scrollContentBackground(.hidden)
        }
        .background(Color("Yellow"))
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarFavouriteButton(favouritable: stadium) {
                stadium.favourited.toggle()
                
                if favouriteStadiums.firstIndex(where: { $0.name == stadium.name }) != nil {
                    context.delete(stadium)
                } else {
                    context.insert(stadium)
                }
                try? context.save()
            }
        }
    }
}

#Preview {
    let exampleMatch = Match(
        date: Date(),
        homeTeam: CountryEnum.newZealand,
        awayTeam: CountryEnum.norway,
        score: "1 - 0",
        tournamentStage: .groupStage,
        group: .groupA
    )
    let exampleStadium = Stadium(
        name: "Eden Park",
        city: "Auckland",
        latitude: -36.87481208922987,
        longitude: 174.7447541218587,
        matches: [exampleMatch]
    )

    return StadiumDetailView(stadium: exampleStadium)
}
