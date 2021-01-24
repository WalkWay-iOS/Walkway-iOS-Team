//
//  CourseDetailVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/24.
//

import UIKit

class CourseDetailVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension CourseDetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailHeaderTVC.identifier) as? DetailHeaderTVC else {
            return UITableViewCell()
        }
        return cell
    }
}

extension CourseDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 555
    }
}

// MARK: - UI
extension CourseDetailVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setButton()
        setView()
        setBottomBar()
    }
    
    private func setTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    
    private func setTableViewNib() {
        let headerNib = UINib(nibName: "DetailHeaderTVC", bundle: nil)
        detailTableView.register(headerNib, forCellReuseIdentifier: DetailHeaderTVC.identifier)
    }
    
    private func setButton() {
        closeButton.tintColor = .bookmarkDarkBlue
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        closeButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        closeButton.addTarget(self, action: #selector(touchUpClose), for: .touchUpInside)
    }
    
    private func setView() {
        view.backgroundColor = .gray50
        setupStatusBar(UIColor.gray50)
        navigationBarView.backgroundColor = .gray50
    }
    
    private func setBottomBar() {
        let bottomView = UIView()
        bottomView.backgroundColor = .gray50
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let bookmarkButton = UIButton()
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkButton.tintColor = .bookmarkDarkBlue
        bookmarkButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(bookmarkButton)
        bookmarkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        bookmarkButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        bookmarkButton.setContentHuggingPriority(.required, for: .horizontal)
        
        let shareButton = UIButton()
        shareButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        shareButton.tintColor = .bookmarkDarkBlue
        shareButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(shareButton)
        shareButton.leadingAnchor.constraint(equalTo: bookmarkButton.trailingAnchor, constant: 25).isActive = true
        shareButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        shareButton.setContentHuggingPriority(.required, for: .horizontal)
        
        let startButton = UIButton()
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        startButton.backgroundColor = .bookmarkDarkBlue
        startButton.layer.cornerRadius = 17
        startButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(startButton)
        startButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 25).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        startButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}

// MARK: - Action
extension CourseDetailVC {
    @objc func touchUpClose() {
        dismiss(animated: true, completion: nil)
    }
}
