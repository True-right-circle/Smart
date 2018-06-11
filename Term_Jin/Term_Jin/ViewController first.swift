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
    
    var check :Int = 0
   
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
    var infoer3:[String] = []
    var infoer4:[String] = []
    var infoer5:[String] = []
    var infoer6:[String] = []
    var infoer7:[String] = []
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
        }
    }
    func parser(_ parser: XMLParser,foundCharacters string: String)
    {
        if element.isEqual(to: "img"){
                urls.append(string)
                loadimage(i: check)
            check += 1
            //print(urls)
        }
        if element.isEqual(to: "title"){
            titler2.append(string)
                loadtext()
        }
        if element.isEqual(to: "price"){

                pricer2.append(string)
                loadprice()
        }
        if element.isEqual(to: "place"){
                discounter2.append(string)
                loaddis()
        }
        if element.isEqual(to: "startDate"){
            startDater2.append(string)
                loadstart()
        }
        if element.isEqual(to: "endDate"){
                endDater2.append(string)
                loadend()
        }
        if element.isEqual(to: "useCond"){
            if(string != "*")
            {
                infoer2.append(string)
                loadinfo()
            }
            print(infoer2)
            //print(infoer2)
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
        //print(discounter2[0])
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
        
        //img1.image = #imageLiteral(resourceName: "test.jpeg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

