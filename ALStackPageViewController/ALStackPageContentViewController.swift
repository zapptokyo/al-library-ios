import UIKit

class ALStackPageContentViewController: UIViewController {
	internal var contentInsetTop: CGFloat {
		return 0.0
	}
	
	internal var contentInsetBottom: CGFloat {
		return 0.0
	}
	
	internal var heightTabBar: CGFloat {
		if #available(iOS 11.0, *) {
			return self.view.safeAreaInsets.bottom
		} else {
			return self.tabBarController?.tabBar.frame.size.height ?? 0
		}
	}
	
	internal var safeAreaInsetsBottom: CGFloat {
		if #available(iOS 11.0, *) {
			return self.view.safeAreaInsets.bottom
		} else {
			return CGFloat(0.0)
		}
	}
	
	public var attributedTitleMain: NSMutableAttributedString {
		let lineHeight = CGFloat(22.0)
		let paragraphStyle = NSMutableParagraphStyle().apply {
			$0.lineBreakMode = .byTruncatingTail
			$0.minimumLineHeight = lineHeight
			$0.maximumLineHeight = lineHeight
		}
		
		return NSMutableAttributedString(string: self.title ?? "Main").apply {
			$0.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, $0.length))
		}
	}
	
	public var attributedTitleSub: NSMutableAttributedString {
		let lineHeight = CGFloat(22.0)
		let paragraphStyle = NSMutableParagraphStyle().apply {
			$0.lineBreakMode = .byTruncatingTail
			$0.minimumLineHeight = lineHeight
			$0.maximumLineHeight = lineHeight
		}
		
		return NSMutableAttributedString(string: self.title ?? "Sub").apply {
			$0.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, $0.length))
		}
	}
    
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}
}
