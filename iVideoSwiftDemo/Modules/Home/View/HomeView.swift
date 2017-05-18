//
// Created by Ramesh Manageni.
// Copyright (c) 2017 Ramesh Manageni. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

final class HomeView: UITableViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    var videoDetailsModelArray = [HomeViewOutputModel]()
    var pageNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.notifyViewDidLoad()
        //self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func setVideoDetails(details: [HomeViewOutputModel]) {
        videoDetailsModelArray.append(contentsOf:details)
        self.tableView.reloadData()
    }
    
    func getAlbumId() -> HomeViewModel {
        return HomeViewModel(
            albumId: "58",
            pageNumber: String(pageNumber)
        )
    }

    // MARK: - UITableView Delegate and DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoDetailsModelArray.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let videoDomainModel = videoDetailsModelArray[indexPath.row]
        
        cell.title.text = videoDomainModel.title.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        cell.videoDescription.text = videoDomainModel.description
        cell.userName.text = videoDomainModel.userName
        cell.thumbnailImage.kf.setImage(with: URL(string: videoDomainModel.thumbnailImage))
        cell.userImage.kf.setImage(with: URL(string: videoDomainModel.userPortrait))
        
        let dateString = videoDomainModel.uploadDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateObj = dateFormatter.date(from: dateString)
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd/MM/yyyy - hh:mm a"
        let calendar =  Calendar(identifier: .gregorian)
        let date1 = calendar.date(from: DateComponents(year: calendar.component(.year, from: dateObj!), month: calendar.component(.month, from: dateObj!), day: calendar.component(.day, from: dateObj!), hour: calendar.component(.hour, from: dateObj!), minute: calendar.component(.minute, from: dateObj!)))!
        let timeOffset = date1.relativeTime // "1 year ago"
        cell.uploadDate.text = timeOffset

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       presenter?.notifyVideoSelected()
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = videoDetailsModelArray.count - 1
        if indexPath.row == lastElement {
            pageNumber += 1
            self.presenter?.notifyLoadMore()
        }
    }
    
    override func displayProgress(message: String) {
        super.displayProgress(message: message)
    }
    
    override func dismissProgress() {
        super.dismissProgress()
    }

    func displayErrorMessage(message: String) {
        super.showErrorMessage(message: message)
    }
}
