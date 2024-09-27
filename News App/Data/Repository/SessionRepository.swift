//
//  SessionRepository.swift
//  News App
//
//  Created by Wildan Nafian on 9/24/24.
//

import Foundation

protocol SessionRepository {
    func isFirstLaunch() -> Bool
    func setIsNotFirstLaunch()
}

struct SessionRepositoryImpl: SessionRepository {

    private let localStorage = LocalStorageImpl()

    func isFirstLaunch() -> Bool {
        return localStorage.isFirstLaunch()
    }

    func setIsNotFirstLaunch() {
        localStorage.setIsNotFirstLaunch()
    }

}
