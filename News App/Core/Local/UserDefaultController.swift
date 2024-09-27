//
//  UserDefaultController.swift
//  News App
//
//  Created by Wildan Nafian on 9/24/24.
//

import Foundation

struct UserDefaultController {
    private let userDefault = UserDefaults.standard

    func save(key: String, value: Bool){
        userDefault.setValue(value, forKey: key)
    }

    func get(key: String) -> Bool {
        return userDefault.bool(forKey: key)
    }

}
