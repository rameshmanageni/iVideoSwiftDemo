//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class HomeViewModel {
    var albumId: String = ""
    var pageNumber: String = ""
    
    init(albumId: String, pageNumber: String) {
        self.albumId = albumId
        self.pageNumber = pageNumber
    }
}
