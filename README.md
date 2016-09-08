# CollapseTransitioning

![Demo.gif](./Demo.gif)

为要Present的ViewController接受UIViewControllerTransitioningDelegate

Present时将自己设为代理

并实现此方法
```
- animationControllerForDismissedController:
```
在其中返回CollapseAnimator对象即可
亦可设置时间间隔