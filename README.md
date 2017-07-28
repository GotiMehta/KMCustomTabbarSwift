# customTabbar_Swift
Import only two classes. Change the existing images with yours. Add Delegate methods in AppDelegate class. Hurray!!! You've your custom tab bar. Enjoy.

In ViewControllers in which you want to add Tab bar:

    var APPDELEGATE = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notifications"
        APPDELEGATE.tmpView = self.view
        APPDELEGATE.addTabBarControler(selectedIndex: 1)
    }
