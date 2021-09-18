//
//  ViewController.swift
//  RPS_Game
//
//  Created by 陳鋐洋 on 2021/9/18.
//

import UIKit

class ViewController: UIViewController {
    
    var winScore = 0
    var loseScore = 0
    var drawScore = 0

    @IBOutlet weak var tvResult: UILabel!
    @IBOutlet weak var tvLoseScore: UILabel!
    @IBOutlet weak var tvWinScore: UILabel!
    @IBOutlet weak var tvDrawScore: UILabel!
    @IBOutlet weak var tvRobot: UILabel!
    
    @IBOutlet weak var tvResetScore: UIButton!
    @IBOutlet weak var tvScissors: UIButton!
    @IBOutlet weak var tvRock: UIButton!
    @IBOutlet weak var tvPaper: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winScore = 0
        loseScore = 0
        drawScore = 0
        
        tvWinScore.text = "0"
        tvLoseScore.text = "0"
        tvDrawScore.text = "0"
        
        gameReset()
    }

    @IBAction func btPlayagain(_ sender: Any) {
        gameReset()
    }
    
    @IBAction func btResetScore(_ sender: Any) {
        
        let alert = UIAlertController(title: NSLocalizedString("alertTitle", comment: ""), message: NSLocalizedString("alertMsg", comment: ""), preferredStyle: .alert)
        let ok = UIAlertAction(title: NSLocalizedString("okTitle", comment: ""), style: .default) { action in
            self.winScore = 0
            self.loseScore = 0
            self.drawScore = 0
            
            self.tvWinScore.text = "0"
            self.tvLoseScore.text = "0"
            self.tvDrawScore.text = "0"
        }
        let cancel = UIAlertAction(title: NSLocalizedString("cancelTitle", comment: ""), style: .destructive, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
       
    }
    
    @IBAction func btScissors(_ sender: Any) {
        tvResetScore.isHidden = true
        tvScissors.isEnabled = false
        play(.scissors)
    }
    
    @IBAction func btRock(_ sender: Any) {
        tvResetScore.isHidden = true
        tvRock.isEnabled = false
        play(.rock)
    }
    
    @IBAction func btPaper(_ sender: Any) {
        tvResetScore.isHidden = true
        tvPaper.isEnabled = false
        play(.paper)
    }
    
}
extension ViewController {
    
    func gameReset (){
        tvRobot.text = "🤖"
        tvResult.text = NSLocalizedString("result", comment: "")
        
        tvRock.isHidden = false
        tvPaper.isHidden = false
        tvScissors.isHidden = false
        
        tvRock.isEnabled = true
        tvPaper.isEnabled = true
        tvScissors.isEnabled = true
        
        view.backgroundColor = .systemBlue
        tvResetScore.isHidden = false
    }
    
    // 電腦隨機出拳
    func randonComputer ()->Sign {
        let temp = Int.random(in: 0...2)
        
        switch temp {
        case 0:
            tvRobot.text = Sign.scissors.rawValue
            return Sign.scissors
        case 1:
            tvRobot.text = Sign.rock.rawValue
            return Sign.rock
        case 2:
            tvRobot.text = Sign.paper.rawValue
            return Sign.paper
        default : return Sign.error
        }
        
        
    }
    
    func play(_ playerSign: Sign){
 
        // 隱藏非選取物件
        switch playerSign {
        case .scissors:
            tvRock.isHidden = true
            tvPaper.isHidden = true
        case .rock:
            tvScissors.isHidden = true
            tvPaper.isHidden = true
        case .paper:
            tvScissors.isHidden = true
            tvRock.isHidden = true
        case .error: return
        }
        
        // 電腦出的
        let computerSign = randonComputer()
        
        // 判斷輸贏
        let resultState = playerSign.compare(computerSign: computerSign)
        switch resultState {
        case .win:
            winScore += 1
            tvWinScore.text = String(winScore)
            view.backgroundColor = .green
            tvResult.text = resultState.state
            break
            
        case .lose:
            loseScore += 1
            tvLoseScore.text = String(loseScore)
            view.backgroundColor = .red
            tvResult.text = resultState.state
            break
            
        case .draw:
            drawScore += 1
            tvDrawScore.text = String(drawScore)
            view.backgroundColor = .yellow
            tvResult.text = resultState.state
            break
        }
        
    }
    
    
    
}
