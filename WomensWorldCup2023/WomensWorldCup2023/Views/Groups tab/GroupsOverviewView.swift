//
//  GroupsOverviewView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct GroupsOverviewView: View {
    private var groups: [Group] = []

    var body: some View {
        NavigationStack {
            List(groups, id: \.groupName) { group in
                GroupView(group: group)
                    .cornerRadius(20)
                    .listRowBackground(Color("Yellow"))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(Color("Yellow"))
            .navigationTitle("Groups")
        }
    }

    init() {
        self.setNavigationTitleColour()
        self.loadGroupsData()
    }

    private mutating func loadGroupsData() {
        if let decodedGroups = [Group].loadData(resource: "groups") {
            self.groups = decodedGroups.sortedByAlphabet
        }
    }
}

#Preview {
    GroupsOverviewView()
}
