//
//  DetailPhotoVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/05.
//

import UIKit

class DetailPhotoVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - CollectionViewDelegate
extension DetailPhotoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 121
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoViewAllCVC.identifier, for: indexPath) as? PhotoViewAllCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension DetailPhotoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 18 - 18 - 6) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 18, bottom: 14, right: 18)
    }
}

extension DetailPhotoVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "DetailPhotoPopUpVC") as? DetailPhotoPopUpVC else {
            return
        }
        dvc.modalPresentationStyle = .overCurrentContext
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - UI
extension DetailPhotoVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setView()
        setButton()
    }
    
    private func setTableView() {
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "PhotoViewAllCVC", bundle: nil)
        reviewCollectionView.register(nibName, forCellWithReuseIdentifier: PhotoViewAllCVC.identifier)
    }
    
    private func setView() {
        setupStatusBar(UIColor.gray50)
        navigationBarView.backgroundColor = .gray50
    }
    
    private func setButton() {
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
}

// MARK: - Action
extension DetailPhotoVC {
    @objc func touchUpClose() {
        dismiss(animated: false, completion: nil)
    }
}
