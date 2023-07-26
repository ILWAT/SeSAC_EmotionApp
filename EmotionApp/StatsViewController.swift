//
//  StatsViewController.swift
//  EmotionApp
//
//  Created by 문정호 on 2023/07/25.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet var backgroundView: [UIView]!
    
    @IBOutlet var emotionLabel: [UILabel]!
    
    
    @IBOutlet var countLabel: [UILabel]!
    
    var tappedCount: [Emotion: Int] = [.verryHappy: 0, .happy: 0, .soso: 0, .bad: 0, .veryBad: 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        loadVaules()
    }
    
    
    func setUI(){
        for element in backgroundView {
            element.layer.cornerRadius = 20
        }
        
    }
    
    func loadVaules(){
        for element in tappedCount{
            tappedCount.updateValue(UserDefaults.standard.integer(forKey: "\(element.key)") , forKey: element.key)
            changeText(element.key)
        }
    }
    
    func changeText(_ emotion: Emotion){
        guard let count = tappedCount[emotion] else { return }
        switch emotion
        {
        case .verryHappy: countLabel[0].text = "\(count)점"
        case .happy: countLabel[1].text = "\(count)점"
        case .soso: countLabel[2].text = "\(count)점"
        case .bad: countLabel[3].text = "\(count)점"
        case .veryBad: countLabel[4].text = "\(count)점"
        }
    }
}
