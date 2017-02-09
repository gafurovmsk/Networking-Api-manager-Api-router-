//
//  FavoritesView.swift
//  Magic Mirror
//
//  Created by admin on 31/01/17.
//  Copyright © 2017 Maksim Petrenko. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    let mostBeautyLabel: UILabel = {
        
        let label = UILabel()
        MMSystemLabel.light(label, fontSize: 23, textColor: MMColors.colorBrown, textAligment: .Center)
        label.text = "Самые красивые"
    
        return label
    }()
    
    let butShowFilter: UIButton = {
        
        let but = UIButton()
        but.setImage(UIImage(named: "pink_settings"), forState: .Normal)
        return but
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constructView()
     //   buildFooter()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func constructView(){
        
        // add to view 
        addSubview(butShowFilter)
        addSubview(mostBeautyLabel)
       
        butShowFilter.snp_makeConstraints { (make) in
            make.top.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(20)
            
          //  make.size.equalTo(CGSizeMake(70, 70))
        }

        
        mostBeautyLabel.snp_makeConstraints { (make) in
            make.top.equalTo(30)
            make.centerX.equalToSuperview()
         //   make.right.equalTo(butShowFilter).inset(8)
            make.left.equalToSuperview().offset(65)
            make.height.equalTo(25)
        }
        
        
        
        
    }
    
    
}
