//
//  CCollectionCell.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/20/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class ContainerCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var containerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    static let identifier = "ContainerCollectionCell"
        var container: Container!{
            didSet{
                self.textLabel.text = String(container.id)
                self.titleLabel.text = container.title
                container.getBigImage { [weak self]img in
                    self?.containerImage.image = img
                }
            }
    }
}
