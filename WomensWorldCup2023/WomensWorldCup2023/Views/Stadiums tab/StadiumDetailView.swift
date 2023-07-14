//
//  StadiumDetailView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import SwiftUI

struct StadiumDetailView: View {
    let stadium: Stadium

    var body: some View {
        VStack(spacing: 0) {
            StadiumInfo(stadium: stadium)

            List() {
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
                        ForEach(matches.groupStage, id: \.id) {
                            match in
                            MatchListRow(match: match)
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
                        ForEach(matches.roundOf16, id: \.id) {
                            match in
                            MatchListRow(match: match)
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
                        ForEach(matches.quarterFinal, id: \.id) {
                            match in
                            MatchListRow(match: match)
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
                        ForEach(matches.semiFinal, id: \.id) {
                            match in
                            MatchListRow(match: match)
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
                        ForEach(matches.thirdPlace, id: \.id) {
                            match in
                            MatchListRow(match: match)
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
                        ForEach(matches.final, id: \.id) {
                            match in
                            MatchListRow(match: match)
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
    }

    private var matches: [Match] {
        return stadium.matches
    }
}

struct StadiumDetailView_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "20 July 2023", homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)
    static let exampleStadium = Stadium(name: "Eden Park", city: "Auckland", latitude: -36.87481208922987, longitude: 174.7447541218587, matches: [exampleMatch])

    static var previews: some View {
        StadiumDetailView(stadium: exampleStadium)
    }
}
