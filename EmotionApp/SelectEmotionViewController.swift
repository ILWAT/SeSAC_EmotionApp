//
//  ViewController.swift
//  EmotionApp
//
//  Created by 문정호 on 2023/07/25.
//

import UIKit

class SelectEmotionViewController: UIViewController {
    
    @IBOutlet weak var veryBadBtn: UIButton!
    @IBOutlet weak var badBtn: UIButton!
    @IBOutlet weak var sosoBtn: UIButton!
    @IBOutlet weak var happyBtn: UIButton!
    @IBOutlet weak var veryHappyBtn: UIButton!
    
    @IBOutlet var buttons: [UIButton]!
    
    var tappedCount: [Emotion: Int] = [.verryHappy: 0, .happy: 0, .soso: 0, .bad: 0, .veryBad: 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonUI()

    }
    
    
    func setButtonUI(){
        for element in buttons {
            let plusOneAction = UIAction(title: "+1",image: UIImage(systemName: "plus"), handler: { _ in self.checkEmotionPlus(1, tag: element.tag)})
            let plusThreeAction = UIAction(title: "+3", image: UIImage(systemName: "plus"), handler: { _ in self.checkEmotionPlus(3, tag: element.tag)})
            let plusfiveAction = UIAction(title: "+5", image: UIImage(systemName: "plus"), handler: { _ in self.checkEmotionPlus(5, tag: element.tag)})
            let resetAction = UIAction(title: "reset", image: UIImage(systemName: "trash.slash"), handler: { _ in self.countReset(element.tag)})
            element.menu = UIMenu(options: .displayInline, children: [plusOneAction, plusThreeAction, plusfiveAction, resetAction])
        }
    }
    
    @IBAction func tappedEmotionButton(_ sender: UIButton) {
        checkEmotionPlus(1, tag: sender.tag)
    }
    
    //MARK: - Helper
    
    func checkEmotionPlus(_ count: Int, tag: Int){
        guard let currentEmotion = Emotion(rawValue: tag) else {return}
        guard var currentCount = tappedCount[currentEmotion] else { return }
        
        currentCount += count
        tappedCount.updateValue(currentCount, forKey: currentEmotion)
        print("\(currentCount)번째 클릭입니다.")
        updateUserDefaults(tag)
    }
    
    func updateUserDefaults(_ tag: Int){
        guard let currentEmotion = Emotion(rawValue: tag) else {return}
        
        UserDefaults.standard.set(tappedCount[currentEmotion], forKey: "\(currentEmotion)")
                
    }
    
    func countReset(_ tag: Int){
        guard let currentEmotion = Emotion(rawValue: tag) else {return}
        guard var currentCount = tappedCount[currentEmotion] else { return }
        
        currentCount = 0
        tappedCount.updateValue(currentCount, forKey: currentEmotion)
        print("\(currentCount)번째 클릭입니다.")
        updateUserDefaults(tag)
    }

}

