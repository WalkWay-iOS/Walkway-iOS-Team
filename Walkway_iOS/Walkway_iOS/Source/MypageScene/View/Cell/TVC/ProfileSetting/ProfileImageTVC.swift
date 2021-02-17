//
//  ProfileImageTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/07.
//

import UIKit
import GoogleMaps

class ProfileImageTVC: UITableViewCell {
    static let identifier = "ProfileImageTVC"
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var profileImageButton: UIButton!
    
    var camera = GMSCameraPosition()
    let picker = UIImagePickerController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

/*
// MARK: - Picker
extension ProfileImageTVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = image
            profileImageView.sizeToFit()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        } else {
            print("Camera not available")
        }
    }
}
*/

// MARK: - UI
extension ProfileImageTVC {
    func setUI() {
        //setPicker()
        setButton()
    }
    
    /*
    func setPicker() {
        picker.delegate = self
    }
    */
    
    func setButton() {
        profileImageButton.layer.cornerRadius = profileImageButton.layer.frame.size.width/2
        profileImageButton.setImage(UIImage(systemName: "camera"), for: .normal)
        profileImageButton.setTitle("", for: .normal)
    }
}
