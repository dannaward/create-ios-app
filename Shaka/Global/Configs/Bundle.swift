//
//  Bundle.swift
//  Shaka
//
//  Created by Danna Lee on 9/14/24.
//

import Foundation

enum Config: String {
    case baseURL = "BASE_URL"
    case appVersion = "CFBundleShortVersionString"
    case appId = "APP_ID"
}

extension Bundle {
    static var plist: [String: Any]? {
        guard let url = Bundle.main.url(forResource: "Info", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] else {
            fatalError("Could't load 'Info.plist'.")
        }
        return plist
    }
    
    private static func getString(forKey key: String) -> String {
        guard let value = plist?[key] as? String else {
            fatalError("Could't find key \(key) in 'Info.plist'.")
        }
        return value
    }
    
    static var identifier: String {
        guard let identifier = Bundle.main.bundleIdentifier else {
            fatalError("Could't find bundleIdentifier")
        }
        return identifier
    }
    
    static var baseURL: String {
        return getString(forKey: Config.baseURL.rawValue)
    }
    
    static var appVersion: String {
        return getString(forKey: Config.appVersion.rawValue)
    }
    
    static var appId: String {
        return getString(forKey: Config.appId.rawValue)
    }
}
