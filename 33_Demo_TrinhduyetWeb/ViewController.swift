

import UIKit

class ViewController: UIViewController
{
    var lichSu: Array<String> = Array<String>()
    var viTri: Int = 0
    
    @IBOutlet weak var txtDuongDan: UITextField!
    @IBOutlet weak var wvTrinhDuyet: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func btn_TimKiem(_ sender: Any)
    {
        if let url: URL = URL(string: txtDuongDan.text!)
        {
            var link: String = txtDuongDan.text!
            if link.hasPrefix("http://") || link.hasPrefix("https://")
            {
                let req: URLRequest = URLRequest(url: url)
                wvTrinhDuyet.loadRequest(req)
                lichSu.append(link)
            }
            else
            {
                link = "http://\(link)"
                let url2 = URL(string: link)!
                let req: URLRequest = URLRequest(url: url2)
                wvTrinhDuyet.loadRequest(req)
                lichSu.append(link)
            }
            
            viTri = lichSu.count - 1
        }
        else
        {
            print("Loi duong dan URL")
        }
    }
    
    @IBAction func btn_LoadLaiTrang(_ sender: Any)
    {
        wvTrinhDuyet.reload()
    }
    
    @IBAction func btn_TroVe(_ sender: Any)
    {
        if lichSu.count > 0
        {
            viTri = viTri - 1
            if viTri < 0
            {
                viTri = 0
            }
            
            let url: URL = URL(string: lichSu[viTri])!
            let req: URLRequest = URLRequest(url: url)
            wvTrinhDuyet.loadRequest(req)
            txtDuongDan.text = lichSu[viTri]
        }
    }
    
    @IBAction func btn_KeTiep(_ sender: Any)
    {
        if lichSu.count > 0
        {
            viTri = viTri + 1
            if viTri > lichSu.count - 1
            {
                viTri = lichSu.count - 1
            }
            
            let url: URL = URL(string: lichSu[viTri])!
            let req: URLRequest = URLRequest(url: url)
            wvTrinhDuyet.loadRequest(req)
            txtDuongDan.text = lichSu[viTri]
        }
    }
    
}

