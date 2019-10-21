//
//  ViewModel.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation
class ViewModel{
    var container: Container!
    var containers = [Container](){
        didSet{
            // we use notification to pass data to viewcontroller
            let userInfo: [String:ViewModel] = ["ViewModel":self]
                       NotificationCenter.default.post(name: Notification.Name("Container"), object: nil, userInfo: userInfo)
        }
    }
    // We make service call to get data which is an array of container downloaded from API
    func getContainerData(){
        ContainerService.shared.getContainer {[weak self] containerss in
            self?.containers = containerss
            print("Container count:\(containerss.count)")
        }
    }
}
