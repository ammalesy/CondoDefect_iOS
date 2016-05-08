//
//  NZPhoto.swift
//  NMWedding
//
//  Created by Apple on 1/30/16.
//  Copyright © 2016 dev.com. All rights reserved.
//

import UIKit
import NYTPhotoViewer

class NZPhoto: NSObject,NYTPhoto {
    
    var image: UIImage?
    var imageData: NSData?
    var placeholderImage: UIImage?
    let attributedCaptionTitle: NSAttributedString?
    let attributedCaptionSummary: NSAttributedString?
    let attributedCaptionCredit: NSAttributedString? = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName: UIColor.darkGrayColor()])
    
    init(image: UIImage? = nil, imageData: NSData? = nil, attributedCaptionTitle: NSAttributedString, attributedCaptionSummary:NSAttributedString) {
        self.image = image
        self.imageData = imageData
        self.attributedCaptionTitle = attributedCaptionTitle
        self.attributedCaptionSummary = attributedCaptionSummary
        super.init()
    }

}
