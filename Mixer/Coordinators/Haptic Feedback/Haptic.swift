//
//  Haptic.swift
//  Mixer
//
//  Created by Neftali Samarey on 5/5/22.
//

import UIKit
import AudioToolbox

public enum Haptic {

        case error
        case success
        case warning
        case light
        case medium
        case heavy
        case selection
        case system
        @available(iOS 13.0, *)
        case soft
        @available(iOS 13.0, *)
        case rigid

        public func vibrate() {
            switch self {
            case .error:
                UINotificationFeedbackGenerator().notificationOccurred(.error)

            case .success:
                UINotificationFeedbackGenerator().notificationOccurred(.success)

            case .warning:
                UINotificationFeedbackGenerator().notificationOccurred(.warning)

            case .light:
                UIImpactFeedbackGenerator(style: .light).impactOccurred()

            case .medium:
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

            case .heavy:
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()

            case .selection:
                UISelectionFeedbackGenerator().selectionChanged()

            case .system:
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))

            case .soft:
                if #available(iOS 13.0, *) {
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                }

            case .rigid:
                if #available(iOS 13.0, *) {
                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                }
            }
        }
}
