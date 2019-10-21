//
//  ListViewController.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    var viewModel = ViewModel(){
        didSet{
            self.listTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
    }
    func setupList(){
        // get data from viewModel using notification
        NotificationCenter.default.addObserver(forName: Notification.Name("Container"), object: nil, queue: .main) { note in
        guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
        
        self.viewModel = userInfo["ViewModel"]!
    }
    }}
extension ListViewController: UITableViewDelegate{
    // this function will make all cells 150 points tall
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    //this function will tell us what to do when we tap on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // We have the application understand which cell we have selected.
        let container = viewModel.containers[indexPath.row]
            viewModel.container = container
            // We now make the DetailViewController come to the front with the cell selected as the data source
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            detailVC.viewModel = viewModel
            navigationController?.pushViewController(detailVC, animated: true)
    }
}
extension ListViewController: UITableViewDataSource{
    // This function will decide how many cells it will export to the user
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    // This function will pass the data from viewController to the tableCell in the view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContainerTableCell.identifier, for: indexPath)as! ContainerTableCell
        let container = viewModel.containers[indexPath.row]
        cell.container = container
        return cell
    }
}
