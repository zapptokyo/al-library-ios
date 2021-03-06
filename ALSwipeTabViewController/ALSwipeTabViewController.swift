import XLPagerTabStrip

class ALSwipeTabViewController: ButtonBarPagerTabStripViewController {
    internal var heightTabBar: CGFloat {
        var height = self.tabBarController?.tabBar.frame.size.height ?? 0
        
        if #available(iOS 11.0, *) {
            height = self.view.safeAreaInsets.bottom
        }
        
        return height
    }
    
	internal var swipeTabContentViewControllers = [ALSwipeTabContentViewController]()
	
	init() {
		print("ALSwipeTabViewController:init")
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		self.automaticallyAdjustsScrollViewInsets = false
		
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}
	
	override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
		return self.swipeTabContentViewControllers
	}
}
