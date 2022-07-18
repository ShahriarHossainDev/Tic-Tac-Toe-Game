//
//  MainVC.swift
//  Tic Tac Toe Game
//
//  Created by Shishir_Mac on 18/7/22.
//

import UIKit

class MainVC: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLAbel: UILabel!
    
    @IBOutlet weak var playerVSplayerButton: UIButton!
    @IBOutlet weak var aiVSplayerButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fill()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function
    func fill(){
        titleLAbel.text = "Tic Tac Toe"
        logoImage.image = UIImage(named: "BG 128")
        
        playerVSplayerButton.setTitle("Player VS Player", for: .normal)
        aiVSplayerButton.setTitle("AI VS Player", for: .normal)
        soundButton.setTitle("Sound: ON", for: .normal)
        aboutButton.setTitle("About", for: .normal)
        
        playerVSplayerButton.layer.cornerRadius = 8
        aiVSplayerButton.layer.cornerRadius = 8
        soundButton.layer.cornerRadius = 8
        aboutButton.layer.cornerRadius = 8
    }
    
    // MARK: - Action
    @IBAction func playerVSplayerButtonAction(_ sender: UIButton) {
        let sb:UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc:PlayVC = sb.instantiateViewController(identifier: "PlayVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func aiVSplayerButtonAction(_ sender: UIButton) {
        let sb:UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc:PlayVC = sb.instantiateViewController(identifier: "PlayVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func soundButtonAction(_ sender: UIButton) {
        print("Sound")
    }
    
    @IBAction func aboutButtonAction(_ sender: UIButton) {
        let sb:UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc:AboutVC = sb.instantiateViewController(identifier: "AboutVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
