//
//  ApiServiceProtocol.swift
//  iVideoSwiftDemo
//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ApiServiceProtocol {
    func constructApiEndpoint(base: String, params: [String]) throws -> String
    func constructApiEndpoint(base: String, params: String...) throws -> String
    func constructApiEndpoint(base: String, params: String..., queries: [String: String]) throws -> String
    func constructHeader() -> [String: String]
    func constructHeader(withAccessToken token: String) -> [String: String]
    
    func get(url: String,
             headers: [String : String]?,
             converter: ((JSON) -> Any)?,
             callback: @escaping (ECallbackResultType) -> Void)
}
