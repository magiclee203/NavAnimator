
import UIKit

class DTViewController: UIViewController {
    
    private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        
        self.imageView.image = UIImage(named: "1")
    }
    

}

// MARK: - 私有方法
extension DTViewController {
    
    // MARK: - 配置界面
    private func configUI() {
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
        self.imageView = imageView
        
        button.setTitle("点我展示下一张", forState: .Normal)
        button.addTarget(self, action: #selector(DTViewController.nextImage(_:)), forControlEvents: .TouchUpInside)
        
        self.title = "路飞"
    }
    
    // MARK: - Action
    @objc private func nextImage(sender: UIButton) {
        print("切换图片")
    }
}
