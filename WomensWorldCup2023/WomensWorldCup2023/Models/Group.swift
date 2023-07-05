//
//  Group.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

enum Group: String, Decodable {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case h = "H"

    func fullText() -> String {
        return "Group \(self.rawValue)"
    }
}
