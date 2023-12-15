//
//  GroupEnum.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

enum GroupEnum: String, Decodable {
    case groupA = "A"
    case groupB = "B"
    case groupC = "C"
    case groupD = "D"
    case groupE = "E"
    case groupF = "F"
    case groupG = "G"
    case groupH = "H"

    func fullText() -> String {
        return "Group \(self.rawValue)"
    }
}
