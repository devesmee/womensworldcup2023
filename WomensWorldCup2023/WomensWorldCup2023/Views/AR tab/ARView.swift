//
//  ARView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI
import AVFoundation

struct ARView: View {
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
            Color("Yellow").ignoresSafeArea()
            Text("AR")
        }
        .task {
            await self.setUpCamera()
        }
    }

    private func setUpCamera() async {
        guard await isAuthorized else {
            print("User has not authorized camera usage")
            return
        }
        print("User has authorized camera usage")
        // TODO: implement showing camera view
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView()
    }
}
