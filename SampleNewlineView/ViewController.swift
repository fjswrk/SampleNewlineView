//
//  ViewController.swift
//  SampleNewlineView
//
//  Created by fjsw on 2020/07/10.
//  Copyright © 2020 com.example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        let layout = CustomCollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath)
        
        guard let customeCell = cell as? CustomCollectionViewCell else { return cell }
        if indexPath.row == 0 {
            let label = UILabel()
            label.font = .systemFont(ofSize: 17, weight: .semibold)
            label.textColor = .black
            label.text = "カテゴリ"
            customeCell.replaceView(label)
        } else {
            let label = UILabel()
            label.font = .systemFont(ofSize: 13)
            label.textColor = .link
            label.text = "ホーム&キッチン・ペット・DIY"
            customeCell.replaceView(label)
        }
        return customeCell
    }
}
