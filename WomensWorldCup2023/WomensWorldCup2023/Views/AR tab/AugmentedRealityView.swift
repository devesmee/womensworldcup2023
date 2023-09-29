//
//  AugmentedRealityView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI
import AVFoundation
import ARKit

struct AugmentedRealityView: View {
    @State private var cameraStatus: CameraStatus = .pending
    private var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)

            var isAuthorized = status == .authorized

            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }

            return isAuthorized
        }
    }

    var body: some View {
        ZStack {
            if cameraStatus == .pending {
                Color("Yellow").ignoresSafeArea()
                ProgressView()
            } else if cameraStatus == .unauthorized {
                Color("Yellow").ignoresSafeArea()
                Text("Camera permission is required to use this functionality.")
                    .multilineTextAlignment(.center)
            } else {
                ARViewContainer()
            }
        }
        .task {
            await self.setCameraPermission()
        }
    }

    private func setCameraPermission() async {
        guard await isAuthorized else {
            cameraStatus = .unauthorized
            return
        }
        cameraStatus = .authorized
    }
}

struct AugmentedRealityView_Previews: PreviewProvider {
    static var previews: some View {
        AugmentedRealityView()
    }
}
