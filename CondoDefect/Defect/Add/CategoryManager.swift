//
//  CategoryManager.swift
//  CondoDefect
//
//  Created by Apple on 5/8/16.
//  Copyright © 2016 Nuizoro. All rights reserved.
//

import UIKit

class CategoryManager: NSObject {
    
    class func getDummyCategory()->NSMutableArray {
    
        let cat1:Category = Category()
        cat1.name = "ประตู"
        cat1.listSubCategory = NSMutableArray()
        let sub11:SubCategory = SubCategory()
        sub11.name = "เก็บงานสีสันประตู"
        let sub12:SubCategory = SubCategory()
        sub12.name = "บานประตูเป็นรอย"
        let sub13:SubCategory = SubCategory()
        sub13.name = "บานประตูเป็นกระพรือ"
        cat1.listSubCategory.addObject(sub11)
        cat1.listSubCategory.addObject(sub12)
        cat1.listSubCategory.addObject(sub13)
        
        let cat2:Category = Category()
        cat2.name = "หน้าต่าง"
        cat2.listSubCategory = NSMutableArray()
        let sub21:SubCategory = SubCategory()
        sub21.name = "เก็บงานสีสันหน้าต่าง"
        let sub22:SubCategory = SubCategory()
        sub22.name = "หน้าต่างเป็นรอย"
        let sub23:SubCategory = SubCategory()
        sub23.name = "หน้าต่างเป็นกระพรือ"
        cat2.listSubCategory.addObject(sub21)
        cat2.listSubCategory.addObject(sub22)
        cat2.listSubCategory.addObject(sub23)
        
        let cat3:Category = Category()
        cat3.name = "ผนัง"
        cat3.listSubCategory = NSMutableArray()
        let sub31:SubCategory = SubCategory()
        sub31.name = "เก็บงานสีสันผนัง"
        let sub32:SubCategory = SubCategory()
        sub32.name = "ผนังเป็นรอย"
        let sub33:SubCategory = SubCategory()
        sub33.name = "ผนังแตกร้าว"
        cat3.listSubCategory.addObject(sub31)
        cat3.listSubCategory.addObject(sub32)
        cat3.listSubCategory.addObject(sub33)
        
        
        let array:NSMutableArray = NSMutableArray()
        array.addObject(cat1)
        array.addObject(cat2)
        array.addObject(cat3)
        return array
        
    }

}
