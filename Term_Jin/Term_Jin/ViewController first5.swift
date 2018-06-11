//
//  ViewController.swift
//  Term_Jin
//
//  Created by Jin on 2018. 5. 18..
//  Copyright © 2018년 Jin. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerfirst5: UIViewController,XMLParserDelegate {
    @IBOutlet weak var testweb: UIWebView!
    

    @IBAction func img5(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: infoer3[4])! as URL)
        
    }
    @IBOutlet weak var getinfo: UILabel!
    @IBOutlet weak var de: UILabel!
    @IBOutlet weak var ds: UILabel!
    @IBOutlet weak var discount: UILabel!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ptitle: UILabel!
    @IBOutlet weak var mainimg: UIImageView!
    
    var check :Int = 0
    var map: String = ""
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
            //print(urls)
        }
        if element.isEqual(to: "ticketImg"){
            infoer3.append(string)
            //print(urls)
        }
        if element.isEqual(to: "title"){
            if string != "'"
            {
                titler2.append(string)
                loadtext(i: check)
            }
        }
        if element.isEqual(to: "place"){
            discounter2.append(string)
            loaddis(i: check)
        }
        if element.isEqual(to: "startDate"){
            startDater2.append(string)
            loadstart(i: check)
        }
        if element.isEqual(to: "endDate"){
            endDater2.append(string)
            loadend(i: check)
            
        }
        if element.isEqual(to: "useCond"){
            if(string != "*")
            {
                infoer2.append(string)
                loadinfo(i: check)
                check += 1
            }
        }
    }
    
    func loadinfo(i: Int)
    {
        if i == 4{
            getinfo.text = infoer2[4]
        }
    }
    func loadend(i: Int)
    {
        if i == 4{
            de.text = endDater2[4]
        }
    }
    func loadstart(i: Int)
    {
        if i == 4{
            ds.text = startDater2[4]
        }
    }
    func loaddis(i: Int)
    {
        if i == 4{
            discount.text = discounter2[5]
            map = "https://map.naver.com/?query="+discounter2[5]+"&type=SITE_1&siteOrder="
        }
    }
    func loadtext(i: Int)
    {
        if i == 4{
            ptitle.text = titler2[4]
        }
    }
    func loadprice(i: Int)
    {
        if i == 4{
            price.text = pricer2[4]
        }
    }
    func loadimage(i: Int)
    {
        do {
            if i == 4
            {
                let url = URL(string: urls[4])
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
        let testurl = map
        let encoded = testurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let realu = URL(string: encoded)
        let request = URLRequest(url: realu!)
        testweb.loadRequest(request)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

