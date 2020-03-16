# LOToastView
iOS简易小巧的短暂提示框，枚举动画类型：从顶部弹出、底部弹出、中间淡入淡出。

### 演示：
##### （录制视频转gif为了压缩体积，所以看上去模糊且有卡顿）

![gif演示](https://github.com/laoou002/LOToastView/blob/master/boke001.gif)

### 使用方法：
```objc
//中间淡入淡出
[LOToastView showWithMsg:@"我在中间" showType:LOToastShowTypeCenter];
//从顶部弹出
[LOToastView showWithMsg:@"我从天上来"];
//从底部弹出
[LOToastView showWithMsg:@"我从下边来" showType:LOToastShowTypeBottom];
```

##### 为快速开发，可将提示框定义为全局宏，如

### 宏定义大致如
```objc
//短暂的消息提示
#define Toast(msg)\
[LOToastView showWithMsg:msg]
```

### 使用方法：
```objc
Toast(@"请输入用户名!")
```
