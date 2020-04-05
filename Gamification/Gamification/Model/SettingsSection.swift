//
//  SettingsSection.swift
//  Gamification
//
//  Created by Nurbek on 3/28/20.
//  Copyright © 2020 Nurbek. All rights reserved.
//

import Foundation

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}
enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case Location
    case Communications
    
    var description: String {
        switch self {
        case .Location:
            return "Орналасуы"
        case .Communications:
            return "Параметрлер"
        }
    }
}

enum LocationOptions: Int, CaseIterable, SectionType {
    case Location
    
    var containsSwitch: Bool {
        return false
    }
    
    var description: String {
        switch self {
        case .Location:
            return "Орналасуы"
        }
    }
    
    
}

enum CommunicationOptions: Int, CaseIterable, SectionType {
    case Notifications
    case Reminder
    case DarkMode
    var containsSwitch: Bool {
        switch self {
        case .Notifications:
            return true
        case .Reminder:
            return true
        case .DarkMode:
            return true
        }
    }
    
    var description: String {
        switch self {
        case .Notifications:
            return "Хабарламалар"
        case .Reminder:
            return "Ескертулер"
        case .DarkMode:
            return "Қараңғы режим"
        }
    }
    
    
}
