//
//  ContainerTableCell.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class ContainerTableCell: UITableViewCell {

    @IBOutlet weak var containerImage: UIImageView!
    
    @IBOutlet weak var containerId: UILabel!
    @IBOutlet weak var containerTitle: UILabel!
    
    static let identifier = "ContainerTableCell"
    var container: Container!{
        didSet{
            self.containerId.text = String(container.id)
            self.containerTitle.text = container.title
            container.getSmallImage { [weak self]img in
                self?.containerImage.image = img
            }
         }
    }
}
