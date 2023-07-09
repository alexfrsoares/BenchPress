//
//  Extensions.swift
//  Bench press workout
//
//  Created by Alex Freitas on 09/07/2023.
//

import SwiftUI

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
