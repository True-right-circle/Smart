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
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    var check :Int = 1
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
   
    var imageurl :[String] = []
    var urls :[String] = []

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
            
            imageurl = []

        }
    }
    func parser(_ parser: XMLParser,foundCharacters string: String)
    {
        if element.isEqual(to: "img"){
            for i in 0..<check+1
            {
                print(check)
                imageurl.insert(string, at: i)
                urls.append(contentsOf: imageurl)
                loadimage(i: i)
                print(imageurl[i])
            }
            check += 1
        }
    }
    
    
    func loadimage(i: Int)
    {
       
        do {
            if i == 0
            {
                let url = URL(string: urls[0])
                let data = try Data(contentsOf: url!)
                img1.image = UIImage(data: data)
                
            }
            if i == 2
            {
                let url = URL(string: urls[3])
                let data = try Data(contentsOf: url!)
                img2.image = UIImage(data: data)
                
            }
        }
        catch{
            print(error)
        }

        //img1.image = #imageLiteral(resourceName: "test.jpeg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        print(urls)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

