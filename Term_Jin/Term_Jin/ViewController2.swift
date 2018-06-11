//
//  ViewController.swift
//  Term_Jin
//
//  Created by Jin on 2018. 5. 18..
//  Copyright © 2018년 Jin. All rights reserved.
//
import Foundation
import UIKit


class ViewController2: UIViewController,XMLParserDelegate {
 
    public var divind :Int = 10
    
    @IBOutlet weak var img4: UIImageView!
    
    @IBAction func img6(_ sender: Any) {
        divind = 6
    }
    @IBAction func img3(_ sender: Any) {
        divind = 3
    }
    @IBAction func img2(_ sender: Any) {
        divind = 2
    }
    @IBAction func img4(_ sender: Any) {
        divind = 4
    }
    @IBAction func img5(_ sender: Any) {
        divind = 5
    }
    @IBAction func img1(_ sender: Any) {
        divind = 1
        print("값이 바뀝니다")
    }
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    var check :Int = 0
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    //var testint : Int = 0
    var imageurl :[String] = []
    var urls :[String] = []
    
    func sendM(i: Int)->Int
    {
        return i
    }
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string:"http://www.culture.go.kr/openapi/rest/ticketdiscounts?ServiceKey=%2F3AEJBd1vcRO0ErsjC7gmLUi7WvMGdMrwgY86vbDyWsWun98FtVFl%2BJehIVuPPi%2B0jn7MSpRFMRQc00IUp11vg%3D%3D&RequestTime=20180509:22:15&CallBackURI=&keyword=&cPage=1&rows=10"))!)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser:XMLParser, didStartElement elementName:
        String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict:[String:String])
    {
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "ticketList")
        {

            elements = NSMutableDictionary()
            elements = [:]
            //print("1번이 돕니다")
        }
    }
    func parser(_ parser: XMLParser,foundCharacters string: String)
    {
        if element.isEqual(to: "img"){
             //print("2번이 돕니다")
            imageurl.append(string)
            loadimage(i: check)
            check += 1
        }
    }
    
    
    func loadimage(i: Int)
    {
        
        do {
            if i == 0
            {
                let url = URL(string: imageurl[0])
                let data = try Data(contentsOf: url!)
                img1.image = UIImage(data: data)
                
            }
            if i == 1
            {
                let url = URL(string: imageurl[1])
                let data = try Data(contentsOf: url!)
                img2.image = UIImage(data: data)
                
            }
            if i == 2
            {
                let url = URL(string: imageurl[2])
                let data = try Data(contentsOf: url!)
                img3.image = UIImage(data: data)
                
            }
            if i == 3
            {
                let url = URL(string: imageurl[3])
                let data = try Data(contentsOf: url!)
                img4.image = UIImage(data: data)
                
            }
            if i == 4
            {
                let url = URL(string: imageurl[4])
                let data = try Data(contentsOf: url!)
                img5.image = UIImage(data: data)
                
            }
            if i == 5
            {
                let url = URL(string: imageurl[5])
                let data = try Data(contentsOf: url!)
                img6.image = UIImage(data: data)
            }
        }
        catch{
            print("Die")
        }
        
        //img1.image = #imageLiteral(resourceName: "test.jpeg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        print(divind)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

