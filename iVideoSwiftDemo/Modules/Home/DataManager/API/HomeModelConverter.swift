//
//  HomeModelConverter.swift
//  iVideoSwiftDemo
//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomeModelConverter {
    func fromJson(json: JSON) -> HomeViewOutputModel {
        let title = json["title"].stringValue
        let description = json["description"].stringValue
        let uploadDate = json["upload_date"].stringValue
        let userName = json["user_name"].stringValue
        let thumbnailImage = json["thumbnail_large"].stringValue
        let userPortrait = json["user_portrait_huge"].stringValue
        
        // Form the model to be sent
        let model: HomeViewOutputModel = HomeViewOutputModel()
        model.title = title
        model.description = description
        model.uploadDate = uploadDate
        model.userName = userName
        model.thumbnailImage = thumbnailImage
        model.userPortrait = userPortrait

        return model
    }
    
    func fromJson(json: JSON) -> [HomeViewOutputModel] {
        var model: [HomeViewOutputModel] = []
        let jsonArray = json.arrayValue
        
        for jsonStore in jsonArray {
            let store = self.fromJson(json: jsonStore) as HomeViewOutputModel
            model.append(store)
        }
        return model
    }
}
