//
//  LocalStorage.swift
//  News App
//
//  Created by Wildan Nafian on 9/24/24.
//

import Foundation

protocol LocalStorage {
    func isFirstLaunch() -> Bool
    func setIsNotFirstLaunch()
}

struct LocalStorageImpl: LocalStorage {
    private let storage = UserDefaultController()

    func isFirstLaunch() -> Bool {
        return storage.get(key: LocalStorageConstant.IS_FIRST_LAUNCH)
    }

    func setIsNotFirstLaunch() {
        storage.save(key: LocalStorageConstant.IS_FIRST_LAUNCH, value: true)
    }
}
