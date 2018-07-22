//
//  ViewController.swift
//  PhotoApp
//
//  Created by David Hortsman on 7/22/18.
//  Copyright © 2018 David Hortsman. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  var imagePickerController: UIImagePickerController!
  var imageCounter = 0
    var imageNameDefault = "image0.png"
    @IBOutlet weak var cameraImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhoto(_ sender: UIButton) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    func saveImage(imageName: String){
    
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        let image = cameraImage.image!
        let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    
    }
    @IBAction func savePhoto(_ sender: UIButton) {
        saveImage(imageName: imageNameDefault)
        imageCounter += 1
        imageNameDefault = "image\(imageCounter).png"
    }

    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        cameraImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! GalleryViewController
        destinationVC.imageCounter = imageCounter
        destinationVC.imageNameDefault = imageNameDefault
    }
    
    
}

