//
//  ECallbackResultType.swift
//  iVideoSwiftDemo
//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

public enum ECallbackResultType {
    case Success(Any?)
    case Failure(EApiErrorType)
}
