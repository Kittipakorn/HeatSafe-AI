//
//  Shake.swift
//  Heatsafe
//
//  Created by Kittiapakorn Seenak on 10/2/2568 BE.
//

import Foundation
import UIKit
import SwiftUI
import CoreMotion

// ✅ Shake Detector (ใช้ CoreMotion)
class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    var shakeThreshold: Double = 3
    var onShake: (() -> Void)?

    func startMonitoring() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                if let data = data {
                    let acceleration = abs(data.acceleration.x) + abs(data.acceleration.y) + abs(data.acceleration.z)
                    if acceleration > self.shakeThreshold {
                        print("✅ Shake detected! Acceleration: \(acceleration)")
                        self.onShake?()
                    }
                }
            }
        }
    }

    func stopMonitoring() {
        motionManager.stopAccelerometerUpdates()
    }
}

struct DeviceShakeViewModifier: ViewModifier {
    @ObservedObject private var motionManager = MotionManager()
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                motionManager.onShake = action
                motionManager.startMonitoring()
            }
            .onDisappear {
                motionManager.stopMonitoring()
            }
    }
}

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
