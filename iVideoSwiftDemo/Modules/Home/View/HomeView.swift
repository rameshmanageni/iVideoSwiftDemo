//
// Created by hhtopcu.
// Copyright (c) 2016 hhtopcu. All rights reserved.
//

import Foundation
import UIKit

final class OrdersListView: UITableViewController, OrdersListViewProtocol {
    var presenter: OrdersListPresenterProtocol?
    /** to resize cell */
    var labelHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activateHamburgerIcon()
        self.activateMyOrderIcon()
        self.activateSearchIcon()
        self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter?.notifyViewWillAppear()
    }

    // MARK: - UITableView Delegate and DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 - labelHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersListTableViewCell", for: indexPath) as! OrdersListTableViewCell
        /** for testing purpose: - to change Order Status and its logo image accordingly */
        let statusArray = ["COMPLETE", "IN PROGRESS", "AWAITING", "CANCELED"]
        let randomIndex = Int(arc4random_uniform(UInt32(statusArray.count)))
        print(statusArray[randomIndex])
        
        cell.orderStatusLabel.text = statusArray[randomIndex]
        cell.orderStatusLogo.image = statusLogoColor(colorCode: cell.orderStatusLabel.text!)
        
        if cell.orderStatusLabel.text != "IN PROGRESS" && cell.orderStatusLabel.text != "AWAITING" {
            cell.pickupDeliveryTimeLabel.isHidden = true
            cell.pickupDeliveryLabel.isHidden = true
            labelHeight = cell.orderStatusLabel.frame.size.height
        } else {
            if cell.orderStatusLabel.text == "AWAITING" {
                cell.pickupDeliveryLabel.text = "Delivery Time".localized(in: "OrdersListView")
            }
            cell.pickupDeliveryTimeLabel.isHidden = false
            cell.pickupDeliveryLabel.isHidden = false
            labelHeight = 0
        }
        
        /** To add custom separator to TableViewCell */
        if indexPath.row != 0 { cell.addSeparatorLine() }
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let oredersTitleCell = tableView.dequeueReusableCell(withIdentifier: "OrdersListTitleViewCell") as! OrdersListTitleViewCell
        oredersTitleCell.quickOrdersButton.addTarget(self, action: #selector(self.onQuickOrdersButtonTapped), for: .touchUpInside)
        return oredersTitleCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.notifyOrderSelected()
    }
    
    func onQuickOrdersButtonTapped() {
        presenter?.notifyQuickOrdersButtonTapped()
    }
    
    func ordersListDetails(details: [OrdersListViewOutputModel]) {
        
    }
    
    func displayErrorMessage(message: String) {
        self.showStylishErrorMessage(message: message)
    }
    
}
