# TouchKitDome
用于实现iOS实时触摸反馈(主要用于录屏功能)


>实现效果
通过重写UIWindow,捕捉所有屏幕触摸点,并生成一个小白点做标记,方便录屏记录触摸的动作.

>具体实现
引用RelatedFiles文件夹里的文件.然后修改Appdelegate如下
```
    var window: TOUCHOverlayWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = TOUCHOverlayWindow.init(frame:UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white;
        window?.makeKeyAndVisible();
        
    
        let vc:ViewController = ViewController.init();
        window?.rootViewController = vc;
        
        
        return true
    }
```
(已经移除创建项目时的storybroad)



##提供OC和Swift两个版本,OC版本留有一个开关,可以开启关闭反馈功能...可以参考一下
