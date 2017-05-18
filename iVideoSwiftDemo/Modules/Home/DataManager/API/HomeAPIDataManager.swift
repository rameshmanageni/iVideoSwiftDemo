//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation

final class HomeAPIDataManager: HomeAPIDataManagerInputProtocol {
    let apiService: ApiServiceProtocol = ApiService()
    let homeApiConverter = HomeModelConverter()

    func getVideoListWith(model: HomeViewModel, callback: @escaping (ECallbackResultType) -> Void) {
        do {
            let parameters = ["page": model.pageNumber] as [String : Any]
            let url: String = try apiService.constructApiEndpoint(base: iVideoDemoConfig.BASE_API_URL, params: model.albumId, "videos.json", queries: parameters as! [String : String])

            let headers = apiService.constructHeader()
            
            apiService.get(
                url: url, headers: headers, converter: { (json) -> Any in return self.homeApiConverter.fromJson(json: json) as [HomeViewOutputModel] }, callback: callback)
        } catch {
            // Change it with the real error
            callback(.Failure(.UnknownError))
        }
    }
}
