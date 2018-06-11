//
//  ViewController.swift
//  Term_Jin
//
//  Created by Jin on 2018. 5. 18..
//  Copyright © 2018년 Jin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var buuu: UIButton!
    
    @IBAction func abuu(_ sender: Any) {
        do {
            let explore = StardustView(frame: CGRect(x:(buuu.imageView?.center.x)!,y:(buuu.imageView?.center.y)!,width:15,height:0))
            buuu.imageView?.superview?.addSubview(explore)
            buuu.imageView?.superview?.sendSubview(toBack: explore)
            
            soundIntroPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundintro! ))
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        soundIntroPlayer.play()
    }
    //url = http://www.culture.go.kr/openapi/rest/ticketdiscounts?ServiceKey=%2F3AEJBd1vcRO0ErsjC7gmLUi7WvMGdMrwgY86vbDyWsWun98FtVFl%2BJehIVuPPi%2B0jn7MSpRFMRQc00IUp11vg%3D%3D&RequestTime=20180509:22:15&CallBackURI=&keyword=&cPage=1&rows=10
    
    var soundIntroPlayer = AVAudioPlayer()
    let soundintro = Bundle.main.path(forResource: "win", ofType: "mp3")
    @IBAction func refresh(_ sender: Any) {
        //url requesttime을 현재시간으로 
    }
    @IBAction func assign(_ sender: Any) {
        //voice 연동 가능???
    }
    @IBOutlet weak var LogoImage: UIImageView!
    @IBOutlet weak var assingnButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

