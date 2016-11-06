//
//  RecordEmotionsViewController.swift
//  I AM
//
//  Created by Ant on 2016/11/6.
//  Copyright © 2016年 Lahk. All rights reserved.
//

import UIKit

class RecordEmotionsViewController: UIViewController {
    
    @IBOutlet weak var scrollview: UIScrollView!
    var joyView = EmotionView()
    var sadnessView = EmotionView()
    var angerView = EmotionView()
    var fearView = EmotionView()
    var disgustView = EmotionView()
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        
        scrollview.addSubview(joyView)
        scrollview.addSubview(sadnessView)
        scrollview.addSubview(angerView)
        scrollview.addSubview(fearView)
        scrollview.addSubview(disgustView)
        
        let lp = UILongPressGestureRecognizer(target: self, action: #selector(RecordEmotionsViewController.handleLongPress(_:)))
        sadnessView.addGestureRecognizer(lp)
    }
    
    func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (t) in
                self.sadnessView.emotionValue += 5
            })
        } else if sender.state == .ended {
            if timer != nil && timer!.isValid {
                timer!.invalidate()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let width = self.view.frame.width
        let height = self.view.frame.height - 60
        joyView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        sadnessView.frame = CGRect(x: width, y: 0, width: width, height: height)
        angerView.frame = CGRect(x: width*2, y: 0, width: width, height: height)
        fearView.frame = CGRect(x: width*3, y: 0, width: width, height: height)
        disgustView.frame = CGRect(x: width*4, y: 0, width: width, height: height)
        
        joyView.initView("joy")
        sadnessView.initView("sadness")
        angerView.initView("anger")
        fearView.initView("fear")
        disgustView.initView("disgust")
        
        scrollview.contentSize = CGSize(width: width*5, height: height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
