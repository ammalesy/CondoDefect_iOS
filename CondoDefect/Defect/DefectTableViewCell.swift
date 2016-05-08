//
//  DefectTableViewCell.swift
//  CondoDefect
//
//  Created by Apple on 5/8/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

class DefectTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var directionValueLb: UILabel!
    @IBOutlet weak var categoryValueLb: UILabel!
    @IBOutlet weak var subCategoriesValueLb: UILabel!
    @IBOutlet weak var iconStatusImgView: UIImageView!
    @IBOutlet weak var statusLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
