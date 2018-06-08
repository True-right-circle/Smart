//
//  ViewController.swift
//  Term_Jin
//
//  Created by Jin on 2018. 5. 18..
//  Copyright © 2018년 Jin. All rights reserved.
//

import Foundation
import UIKit


class ViewControllerfirst: UIViewController,XMLParserDelegate {
    

    @IBOutlet weak var getinfo: UILabel!
    @IBOutlet weak var de: UILabel!
    @IBOutlet weak var ds: UILabel!
    @IBOutlet weak var discount: UILabel!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ptitle: UILabel!
    @IBOutlet weak var mainimg: UIImageView!
    
    var check :Int = 1
    var check1 :Int = 1
    var check2 :Int = 1
    var check3 :Int = 1
    var check4 :Int = 1
    var check5 :Int = 1
    var check6 :Int = 1
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
   
    var imageurl :[String] = []
    var urls :[String] = []
    var titler :[String] = []
    var pricer :[String] = []
    var startDater :[String] = []
    var endDater :[String] = []
    var infoer:[String] = []
    var discounter:[String] = []

    var titler2 :[String] = []
    var pricer2 :[String] = []
    var startDater2 :[String] = []
    var endDater2 :[String] = []
    var infoer2:[String] = []
    var discounter2:[String] = []
    
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
                imageurl.insert(string, at: i)
                urls.append(contentsOf: imageurl)
                loadimage(i: i)
            }
            //check += 1
        }
        if element.isEqual(to: "title"){
            for i in 0..<check1+1
            {
                titler.insert(string, at: i)
                titler2.append(contentsOf: titler)
                loadtext()
            }
            //check1 += 1
        }
        if element.isEqual(to: "price"){
            for i in 0..<check2+1
            {
                pricer.insert(string, at: i)
                pricer2.append(contentsOf: pricer)
                loadprice()
            }
           // check2 += 1
        }
        if element.isEqual(to: "place"){
            for i in 0..<check3+1
            {
                discounter.insert(string, at: i)
                discounter2.append(contentsOf: discounter)
                loaddis()
            }
            //check3 += 1
        }
        if element.isEqual(to: "startDate"){
            for i in 0..<check4+1
            {
                startDater.insert(string, at: i)
                startDater2.append(contentsOf: startDater)
                loadstart()
            }
            //check4 += 1
        }
        if element.isEqual(to: "endDate"){
            for i in 0..<check5+1
            {
                endDater.insert(string, at: i)
                endDater2.append(contentsOf: endDater)
                loadend()
            }
            //check5 += 1
        }
        if element.isEqual(to: "useCond"){
            for i in 0..<check6+1
            {
                infoer.insert(string, at: i)
                infoer2.append(contentsOf: infoer)
                loadinfo()
            }
            //check6 += 1
        }
    }
    
    func loadinfo()
    {
        getinfo.text = infoer2[0]
    }
    func loadend()
    {
        de.text = endDater2[0]
    }
    func loadstart()
    {
        ds.text = startDater2[0]
    }
    func loaddis()
    {
        discount.text = discounter2[0]
        print(discounter2[0])
    }
    func loadtext()
    {
        ptitle.text = titler2[0]
    }
    func loadprice()
    {
        price.text = pricer2[0]
    }
    func loadimage(i: Int)
    {
        
        do {
            if i == 0
            {
                let url = URL(string: urls[0])
                let data = try Data(contentsOf: url!)
                mainimg.image = UIImage(data: data)
            }
        }
        catch{
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

