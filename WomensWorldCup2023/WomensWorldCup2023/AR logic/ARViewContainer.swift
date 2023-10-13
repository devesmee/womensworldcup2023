//
//  ARViewContainer.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 29/09/2023.
//

import Foundation
import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    private let arView = ARView(frame: .zero)
    private let footballAnchor = try? Football.loadScene()

    func makeUIView(context: Context) -> ARView {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]

        arView.session.run(config)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    static func dismantleUIView(_ uiView: ARView, coordinator: ()) {
        uiView.session.pause()
    }

    func placeObject(location: CGPoint) {
        guard let raycastQuery = arView.makeRaycastQuery(from: location, allowing: .estimatedPlane, alignment: .any) else {
            print("Something went wrong when creating the raycast query.")
            return
        }
        guard let raycastResult = arView.session.raycast(raycastQuery).first else {
            print("Something went wrong when creating the raycast result.")
            return
        }

        let raycastAnchor = AnchorEntity(world: raycastResult.worldTransform)

        if let footballAnchor {
            arView.scene.anchors.removeAll()
            raycastAnchor.addChild(footballAnchor)
            arView.scene.anchors.append(raycastAnchor)
        }
    }
}
