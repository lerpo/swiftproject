//
//  NewsCellTableViewCell.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/11.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {
    var imgView:UIImageView?
    var contentLable:UILabel?
    var timeLable:UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.imgView = UIImageView()
        self.contentView.addSubview(self.imgView!)
        
        self.contentLable = UILabel()
        self.contentView.addSubview(self.contentLable!)
        
        self.timeLable = UILabel()
        self.contentView.addSubview(self.timeLable!)
        
        setUpViews()
    }
    
    func setUpViews() {
        
        self.imgView?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(0)
            make.width.equalTo(50)
//            make.height.equalTo(50)
            
        })
        self.imageView?.backgroundColor = UIColor.gray
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.contentLable?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(self.imgView!.snp.right).offset(10)
            make.right.equalToSuperview().offset(15)
            make.bottom.equalTo(self.timeLable!.snp.top).offset(5)
        })
        self.contentLable?.numberOfLines = 2
        self.contentLable?.textAlignment = .left
        
        self.timeLable?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.imgView!.snp.right).offset(10)
//            make.top.equalTo(self.contentLable!.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(15)
        })
        self.timeLable?.font = UIFont.systemFont(ofSize: 12)
        self.timeLable?.textAlignment = .left
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpViews()
    }
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
