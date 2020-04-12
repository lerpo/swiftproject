//
//  FindCell.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/12.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class FindCell: UITableViewCell {
  
    
    @IBOutlet weak var imageV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageV.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
}
