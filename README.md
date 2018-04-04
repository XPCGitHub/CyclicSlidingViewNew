# CyclicSlidingView


iOS中用到左右滑动的地方很多，但是一般都是整页或者使用到pageControl来控制滑动，所以用户体验也很固定，很不舒服。

这个项目主要是通过了自定义View来规避来自重用机制的问题，例子中实现了4个视图实现无限滑动的状态，其实用户可以自由设置显示多少个单元的控件了。

因为是第一个版本所以看起来不太舒服，但是用起来很实用。

注意SmallLunboView（.h.m）以及DMDeviceInfomation（.h.m）这几个文件。这是这个项目的核心。其中DMDeviceInfomation是自定义滑动View,而SmallLunboView是自定义滑动的单元

如果您有更好的提议或者兴趣可以加一下鄙人的微信：Xpc1314520xpc

