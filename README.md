# LDEndlessShow
This library provides two category for UIView with support for two endless images show .

It provides:

* show endless images with animations
* include dynamic in controller for demo
* use SDWebImage can download image for internet
* provides a category can optimal performance than collectionViewCell
* More cool show images endless

# How To Use

API documentation is available at [LDEndlessShow](https://github.com/search?utf8=%E2%9C%93&q=LDEndlessShow)

##Using UIView+Animation category with UITableView or anywhere

```
#import "UIView+Animation.h"
...

self.tableView.tableHeaderView = [UIView endlessAnimationWithRect:CGRectMake(0, 0, self.view.bounds.size.width, 200) withArray:array target:self animationTypeName:self.typeName];

```

#Show the effec



> 
![Snip20160402_2.png](http://upload-images.jianshu.io/upload_images/1683652-9bffc0ccf35bbf88.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***

> 
![Snip20160402_3.png](http://upload-images.jianshu.io/upload_images/1683652-087a687c15c26d16.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***

> 
![Snip20160402_4.png](http://upload-images.jianshu.io/upload_images/1683652-1e3652a6a66952ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***
> 
![Snip20160402_5.png](http://upload-images.jianshu.io/upload_images/1683652-bd19e115a4bd9503.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***
> 
![Snip20160402_6.png](http://upload-images.jianshu.io/upload_images/1683652-fee9b2fcb5ea2463.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***
> 
![Snip20160402_7.png](http://upload-images.jianshu.io/upload_images/1683652-909fe991dd8afa6f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***
> 
![Snip20160402_8.png](http://upload-images.jianshu.io/upload_images/1683652-53ab2f6d5c821185.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***