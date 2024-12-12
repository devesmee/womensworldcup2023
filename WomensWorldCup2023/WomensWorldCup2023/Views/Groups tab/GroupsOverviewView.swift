//
//  GroupsOverviewView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 05/07/2023.
//

import SwiftUI

struct GroupsOverviewView: View {
    #if FIREBASE
    @Environment(FirebaseManager.self) private var dataManager
    #else
    @Environment(JSONManager.self) private var dataManager
    #endif

    var body: some View {
        NavigationStack {
            ZStack {
                if let errorMessage = dataManager.groupsErrorMessage {
                    VStack {
                        Text(errorMessage)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    .background(Color("Yellow"))
                } else  {
                    List(dataManager.groups, id: \.groupName) { group in
                        GroupView(group: group)
                            .cornerRadius(20)
                            .listRowBackground(Color("Yellow"))
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .background(Color("Yellow"))
            .navigationTitle("Groups")
            .navigationBarTitleTextColor(Color("Blue"))
        }
    }
}

#Preview {
    GroupsOverviewView()
}
