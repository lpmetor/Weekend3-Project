//
//  GridViewController.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {

    
    @IBOutlet weak var gridViewController: UICollectionView!
    var viewModel = ViewModel(){
        didSet{
            self.gridViewController.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGrid()
    }
    
    func setupGrid(){
        // Got data from modelView using notification
        NotificationCenter.default.addObserver(forName: Notification.Name("Container"), object: nil, queue: .main) { note in
        guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
        
        self.viewModel = userInfo["ViewModel"]!
        }
    }
}
extension GridViewController: UICollectionViewDataSource{
   // This function will decide how many cells it will export to the user
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // This function will pass the data from viewController to the tableCell in the view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridViewController.dequeueReusableCell(withReuseIdentifier: ContainerCollectionCell.identifier, for: indexPath) as! ContainerCollectionCell
        let container = viewModel.containers[indexPath.row]
        cell.container = container
        return cell
    }
    
    
}
extension GridViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height/2
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let container = viewModel.containers[indexPath.row]
        viewModel.container = container
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                   detailVC.viewModel = viewModel
                   navigationController?.pushViewController(detailVC, animated: true)
    }
}

