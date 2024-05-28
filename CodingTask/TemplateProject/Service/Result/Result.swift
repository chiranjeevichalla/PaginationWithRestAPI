//
//  Result.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
