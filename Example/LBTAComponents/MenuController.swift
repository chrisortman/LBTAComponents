//
//  MenuController.swift
//  LBTAComponents
//
//  Created by Brian Voong on 11/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LBTAComponents

class MenuItemCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let menuItem = datasourceItem as? MenuItem else { return }
            label.text = menuItem.name
        }
    }
    
    @objc let label = UILabel()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        addSubview(label)
        
        label.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
    }
    
}

struct MenuItem {
    let name: String
    let controller: DatasourceController
}

class MenuDatasource: Datasource {
    
    override init() {
        super.init()
        let basicMenuItem = MenuItem(name: "Basic", controller: BasicController())
        let basicHeaderCellFooterMenuItem = MenuItem(name: "Basic: Header - Cell - Footer", controller: BasicHeaderCellFooterController())
        let intermediateMenuItem = MenuItem(name: "Intermediate", controller: IntermediateController())
        let intermediateMixedMenuItem = MenuItem(name: "Intermediate Mixed Items", controller: IntermediateMixedController())
        let advancedMenuItem = MenuItem(name: "Advanced", controller: AdvancedController())
        let gridMenuItem = MenuItem(name: "Grid", controller: GridController())
        objects = [basicMenuItem, basicHeaderCellFooterMenuItem, intermediateMenuItem, intermediateMixedMenuItem, advancedMenuItem, gridMenuItem]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [MenuItemCell.self]
    }
    
}

class MenuController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "LBTA Components Menu"
        
        datasource = MenuDatasource()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let controller = (datasource?.item(indexPath) as? MenuItem)?.controller else { return }
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
