//
//  ContainerAPI.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation

struct ContainerAPI{
    let base = "https://jsonplaceholder.typicode.com/photos"
    // getURL will convert the string base into URL type
    var getURL: URL?{
        return URL(string: base)
    }
}
