//
//  Group.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 14/07/2023.
//

struct Group: Decodable {
    let groupName: GroupEnum
    let teams: [Country]
}
