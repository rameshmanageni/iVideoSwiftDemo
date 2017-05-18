//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation

final class OrdersListAPIDataManager: OrdersListAPIDataManagerInputProtocol {
    let mApiService: ApiServiceProtocol = ApiService()
    let mOrdersApiConverter = OrdersListModelConverter()

    func getOrdersList(callback: @escaping (ECallbackResultType) -> Void) {
        do {
            let user = UserService.sharedInstance.getAuthenticatedUser()
            let token = user != nil ? user!.token : ""
            
            let url: String = try mApiService.constructApiEndpoint(base: MezukaConfig.BASE_API_URL, params: "user_profile", "orders")
            let headers = mApiService.constructHeader(withAccessToken: token)
            
            mApiService.get(
                url: url, headers: headers, converter: { (json) -> Any in return self.mOrdersApiConverter.fromJson(json: json) as [OrdersListViewOutputModel] }, callback: callback)
        } catch {
            // Change it with the real error
            callback(.Failure(.UnknownError))
        }
    }
}
