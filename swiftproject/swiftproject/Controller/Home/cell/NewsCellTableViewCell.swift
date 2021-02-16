//
//  NewsCellTableViewCell.swift
//  swiftproject
//
//  Created by 徐孟良 on 2020/4/11.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {
    var userImg:UIImageView?
    var userContent: UIView?
    var userHeadImg:UIImageView?
    var userNameLable:UILabel?
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
        
        self.userImg = UIImageView()
        self.contentView.addSubview(self.userImg!)
        
        self.userContent = UIView()
        self.contentView.addSubview(self.userContent!)
        
        self.userHeadImg = UIImageView()
        self.userContent!.addSubview(self.userHeadImg!)
        
        self.userNameLable = UILabel()
        self.userContent!.addSubview(self.userNameLable!)
        
        self.timeLable = UILabel()
        self.userContent!.addSubview(self.timeLable!)
        
        setUpViews()
    }
    
    func setUpViews() {
        
        self.userImg?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(400)
            
        })
        self.imageView?.contentMode = UIView.ContentMode.scaleToFill
        
        self.userContent?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.userImg!.snp.bottom).offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(88)
        })
        self.userContent?.backgroundColor = ColorConstant.LINE_GRAY
        
        self.userHeadImg?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(50)
            make.height.equalTo(50)
         })
        self.userHeadImg?.layer.cornerRadius = 25
        self.userHeadImg?.layer.masksToBounds = true
        
        self.timeLable?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.userHeadImg!.snp.right).offset(10)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-15)
        })
        self.timeLable?.font = UIFont.systemFont(ofSize: 15)
        self.timeLable?.textAlignment = .center
        self.timeLable?.textColor = .gray
        
        self.userNameLable?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.userHeadImg!.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(100)
            make.bottom.equalToSuperview().offset(-10)
        })
        self.userNameLable?.font = UIFont.systemFont(ofSize: 18)
        self.userNameLable?.textAlignment = .left
        self.userNameLable?.textColor = .gray
        
        
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
