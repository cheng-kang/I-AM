//
//  EmotionView.swift
//  I AM
//
//  Created by Ant on 2016/11/6.
//  Copyright © 2016年 Lahk. All rights reserved.
//

import UIKit

class EmotionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var emotionImageView = UIImageView()
    var initEmotionImageViewAlpha: CGFloat = 0.1
    var maxEmotionValue: CGFloat = 250
    var emotionValue: CGFloat = 0 {
        didSet {
            emotionImageView.alpha = initEmotionImageViewAlpha + emotionValue / maxEmotionValue * 0.9
        }
    }
    
    func initView(_ emotionName: String) {
        emotionImageView.image = UIImage(named: emotionName)!
        
        self.addSubview(emotionImageView)
        emotionImageView.frame = CGRect(x: (self.frame.width - 250) / 2, y: (self.frame.height - 250) / 2, width: 250, height: 250)
        
        emotionImageView.alpha = initEmotionImageViewAlpha
    }

}
