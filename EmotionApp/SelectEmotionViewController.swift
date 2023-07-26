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
    
    let buttonIdentifier: [Int: Emotion] = [1: .verryHappy, 2:.happy, 3:.soso, 4: .bad, 5: .veryBad]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonUI()

    }
    
    
    func setButtonUI(){
        for element in buttons {
            let plusOneAction = UIAction(title: "+1",image: UIImage(systemName: "plus"), handler: { sender in self.checkEmotionPlus(1, tag: element.tag)})
            let plusThreeAction = UIAction(title: "+3", image: UIImage(systemName: "plus"), handler: { sender in self.checkEmotionPlus(3, tag: element.tag)})
            let plusfiveAction = UIAction(title: "+5", image: UIImage(systemName: "plus"), handler: {sender in self.checkEmotionPlus( 5, tag: element.tag)})
            element.menu = UIMenu(options: .displayInline, children: [plusOneAction, plusThreeAction, plusfiveAction])
        }
    }
    
    @IBAction func tappedVeryHappyBtn(_ sender: UIButton) {
        checkEmotionPlus(1, tag: sender.tag)
    }
    @IBAction func tappedHappyBtn(_ sender: UIButton) {
        checkEmotionPlus(1, tag: sender.tag)
    }
    
    @IBAction func tappedSosoBtn(_ sender: UIButton) {
        checkEmotionPlus(1, tag: sender.tag)
    }
    @IBAction func tappedBadBtn(_ sender: UIButton) {
        checkEmotionPlus(1, tag: sender.tag)
    }
    @IBAction func tappedVeryBadBtn(_ sender: UIButton) {
        checkEmotionPlus(1, tag: sender.tag)
    }
    
    //MARK: - Helper
    
    func checkEmotionPlus(_ count: Int, tag: Int){
        guard let currentEmotion = buttonIdentifier[tag] else {return}
        guard var currentCount = tappedCount[currentEmotion] else { return }
        
         currentCount += count
        tappedCount.updateValue(currentCount, forKey: currentEmotion)
        print("\(currentCount)번째 클릭입니다.")
        updateUserDefaults(tag)
    }
    
    func updateUserDefaults(_ tag: Int){
        guard let currentEmotion = buttonIdentifier[tag] else {return}
        
        UserDefaults.standard.set(tappedCount[currentEmotion], forKey: "\(currentEmotion)")
                
    }

}

