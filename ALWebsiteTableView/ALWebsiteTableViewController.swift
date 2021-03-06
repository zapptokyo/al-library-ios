import UIKit
import SVGKit
import INSPullToRefresh

class ALWebsiteTableViewController: ALSwipeTabContentViewController {
	internal let tableView = UITableView()
	
	internal var websites: [ALWebsite]
	internal var cells = [ALWebsiteTableViewCell]()
	
	init(title: String, websites: [ALWebsite], isSwipeTab: Bool, isSloppySwipe: Bool, cellSetting: ALWebsiteTableViewCellSetting) {
		self.websites = websites
		
		super.init(title: title, isSwipeTab: isSwipeTab, isSloppySwipe: isSloppySwipe)
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.cellLayoutMarginsFollowReadableWidth = false
		self.tableView.backgroundColor = .clear
		
		self.tableView.ins_addPullToRefresh(withHeight: 60.0, handler: {scrollView in
			self.pullToRefresh()
		})
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		if #available(iOS 11.0, *) {
			self.tableView.contentInsetAdjustmentBehavior = .never
		}
		
		super.viewDidLoad()
		
		self.tableView.frame = self.view.frame
		
		let heightStatusBar = UIApplication.shared.statusBarFrame.size.height
		let heightNavigationBar = self.navigationController?.navigationBar.frame.size.height ?? 44
		
		self.tableView.contentInset.top = heightStatusBar + heightNavigationBar
		self.tableView.scrollIndicatorInsets.top = heightStatusBar + heightNavigationBar
		
        self.tableView.contentInset.top += self.contentInsetTop
        self.tableView.scrollIndicatorInsets.top += self.contentInsetTop
		
		if let svgCircleWhite = SVGKImage(named: "Resource/Library/CircleWhite.svg"), let svgCircleLight = SVGKImage(named: "Resource/Library/CircleLight.svg") {
			svgCircleWhite.size = CGSize(width: 24, height: 24)
			svgCircleLight.size = CGSize(width: 24, height: 24)
			
			let defaultFrame = CGRect(x: 0, y: 0, width: 24, height: 24)
			
			if let pullToRefresh = INSDefaultPullToRefresh(frame: defaultFrame, back: svgCircleLight.uiImage, frontImage: svgCircleWhite.uiImage.change(color: self.view.tintColor)) {
				self.tableView.ins_pullToRefreshBackgroundView.delegate = pullToRefresh
				self.tableView.ins_pullToRefreshBackgroundView.addSubview(pullToRefresh)
			}
		}
		
		self.view.addSubview(self.tableView)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		if let indexPath = self.tableView.indexPathForSelectedRow {
			self.tableView.deselectRow(at: indexPath, animated: true)
		}
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		self.tableView.contentInset.bottom = self.heightTabBar + self.contentInsetBottom
		self.tableView.scrollIndicatorInsets.bottom = self.heightTabBar + self.contentInsetBottom
	}
	
	func open(alWebsite: ALWebsite) {
	}
	
	func refresh() {
		self.load(done: nil)
	}
	
	func pullToRefresh() {
		self.load(done: {
			self.endPullToRefresh()
		})
	}
	
	func endPullToRefresh() {
		self.tableView.ins_endPullToRefresh()
	}
	
	func beginPullToRefresh() {
		self.tableView.ins_beginPullToRefresh()
	}
}

extension ALWebsiteTableViewController {
	func load(done: (() -> Void)?) {
	}
}

extension ALWebsiteTableViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.cells.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return self.cells[indexPath.row]
	}
}

extension ALWebsiteTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.open(alWebsite: self.websites[indexPath.row])
	}
}
