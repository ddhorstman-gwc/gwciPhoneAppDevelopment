//
//  GalleryViewController.swift
//  PhotoApp
//
//  Created by David Hortsman on 7/22/18.
//  Copyright © 2018 David Hortsman. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    
    var imageCounter = 0
    var imageNameDefault = "image0.png"
    @IBOutlet weak var galleryImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = getImage(imageName: imageNameDefault)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImage(imageName: String) -> Bool{
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath) {
            galleryImage.image = UIImage(contentsOfFile: imagePath)
            return true
        } else {
            print("Oh no! No Image!")
            return false
        }
    }
    
    @IBAction func prevImage(_ sender: UIButton) {
        imageCounter += 1
        imageNameDefault = "image\(imageCounter).png"
        if(getImage(imageName: imageNameDefault)){
        print ("Image loaded successfully.")}
        else{
            imageCounter -= 1
            imageNameDefault = "image\(imageCounter).png"
            _ = getImage(imageName: imageNameDefault)
        }
    }
    @IBAction func nextImage(_ sender: UIButton) {
        if(imageCounter>=0){
        imageCounter = imageCounter - 1
        imageNameDefault = "image\(imageCounter).png"
            _ = getImage(imageName: imageNameDefault)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
