# CollapseTransitioning

![Demo.gif](./Demo.gif)

导入CollapseAnimator的.h、.m两个文件

Present的ViewController接受UIViewControllerTransitioningDelegate

Present时将自己设为代理

并实现此方法
```
- animationControllerForDismissedController:
```
返回CollapseAnimator对象即可
可在其中设置时间间隔