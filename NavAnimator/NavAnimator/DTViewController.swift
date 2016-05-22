
import UIKit

class DTViewController: UIViewController {
    
    private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configData()
    }
}


// MARK: - 私有方法
extension DTViewController {
    
    private var canShowNextImage: Bool {
        return self.navigationController!.viewControllers.count < CardImageManager.sharedManager.images.count
    }
    
    
    // MARK: - 配置界面
    private func configUI() {
        self.view.backgroundColor = UIColor(red: 107.0/255.0, green: 205.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton(type: .System)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 添加约束
        NSLayoutConstraint.activateConstraints([
            imageView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
            imageView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor),
            imageView.widthAnchor.constraintEqualToConstant(225.0),
            imageView.heightAnchor.constraintEqualToConstant(300.0),
            button.centerXAnchor.constraintEqualToAnchor(imageView.centerXAnchor),
            button.topAnchor.constraintEqualToAnchor(imageView.bottomAnchor, constant: 44.0)
            ])
        
        // 配置 UI
        imageView.layer.cornerRadius = 36.0
        imageView.clipsToBounds = true
        self.imageView = imageView
    
        button.setTitle("点我展示下一张", forState: .Normal)
        button.setTitleColor(UIColor(red: 252.0/255.0, green: 81.0/255.0, blue: 197.0/255.0, alpha: 1.0), forState: .Normal)
        button.addTarget(self, action: #selector(DTViewController.nextImage(_:)), forControlEvents: .TouchUpInside)
    }
    
    
    // MARK: - 配置数据
    private func configData() {
        let index = self.navigationController!.viewControllers.count - 1
        self.imageView.image = CardImageManager.sharedManager.images[index].image
        self.title = CardImageManager.sharedManager.images[index].title
    }
    
    
    // MARK: - Action
    @objc private func nextImage(sender: UIButton) {
        if (self.canShowNextImage) {
            let vc = DTViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            self.alertPop()
        }
    }
    
    // MARK: - 弹窗提醒
    private func alertPop() {
        let alert = UIAlertController(title: nil, message: "已经是最后一张了", preferredStyle: .Alert)
        let action = UIAlertAction(title: "确定", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
