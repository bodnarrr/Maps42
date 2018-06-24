//
//  AddressCell.swift
//  Maps42
//
//  Created by Andriy BODNAR on 6/2/18.
//  Copyright © 2018 Andriy BODNAR. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextImage: UIImageView!
    
    func setCell(place : Place) {
        descriptionLabel.text = place.title
    }

}
