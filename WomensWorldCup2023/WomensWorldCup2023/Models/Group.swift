//
//  Group.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 14/07/2023.
//

struct Group: Decodable {
    let groupName: GroupEnum
    let teams: [Country]

    enum CodingKeys: CodingKey {
        case groupName
        case teams
    }

    // Is used so you can create Group instances for preview
    init(groupName: GroupEnum, teams: [Country]) {
        self.groupName = groupName
        self.teams = teams.sorted {
            if $0.points == $1.points {
                return $0.goalDifference > $1.goalDifference
            } else {
                return $0.points > $1.points
            }
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.groupName = try container.decode(GroupEnum.self, forKey: .groupName)
        let unorderedTeams = try container.decode([Country].self, forKey: .teams)

        self.teams = unorderedTeams.sorted {
            if $0.points == $1.points {
                return $0.goalDifference > $1.goalDifference
            } else {
                return $0.points > $1.points
            }
        }
    }
}
