//
//  ARViewContainer.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 29/09/2023.
//

import Foundation
import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let footballAnchor = try! Football.loadScene()
        arView.scene.anchors.append(footballAnchor)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
