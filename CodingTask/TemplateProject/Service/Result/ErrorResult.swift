//
//  File.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
