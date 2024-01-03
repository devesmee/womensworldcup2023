//
//  DecodableLoadData.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 03/01/2024.
//

import Foundation

extension Decodable {

    static func loadData(resource: String) -> Self? {
        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return try JSONDecoder().decode(self, from: data)
            } catch {
                print("Something went wrong when fetching data:")
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
}
