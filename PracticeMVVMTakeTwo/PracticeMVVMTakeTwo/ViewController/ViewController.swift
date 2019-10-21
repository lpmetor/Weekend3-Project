//
//  ViewController.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()
    @IBOutlet weak var listViewController: UIView!
    @IBOutlet weak var gridViewController: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMain()
    }
    func setupMain(){
        viewModel.getContainerData()
    }
    @IBAction func switchButtonAction(_ sender: Any) {
        listViewController.isHidden.toggle()
        gridViewController.isHidden.toggle()
    }
}

