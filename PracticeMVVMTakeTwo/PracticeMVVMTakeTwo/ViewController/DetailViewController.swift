//
//  DetailViewController.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/20/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    var viewModel: ViewModel!
    
    //properties and variables are always above viewDidLoad (convention and best practice)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.container.getBigImage {[weak self]img in
            self?.detailImage.image = img
        }
    }
    //only functions below func viewDidLoad
}
