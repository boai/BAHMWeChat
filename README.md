# BAHMWeChat

鸿蒙版微信，内含：组件化方案、自定义组件化路由方案、通讯录实现、朋友圈实现



> 组件化方案：多 har 模块、动态路由注册…
>
> 组件化动态路由方案：用插件实现 har 模块自动动态注册路由
>
> 通讯录实现：通讯录 group 列表、动态 index 索引列表、列表索引联动
>
> 朋友圈实现：动态cell自适应高度、多行文字展开收回、评论
>
> 后期会有：搜索、JSON 解析、网络解析、本地缓存…



 [TOC] 

## 1、应用截图

![通讯录](https://github.com/boai/BAHMWeChat/blob/main/images/通讯录.png)

![发现](https://github.com/boai/BAHMWeChat/blob/main/images/发现.png)

![朋友圈](https://github.com/boai/BAHMWeChat/blob/main/images/朋友圈.png)

![个人中心](https://github.com/boai/BAHMWeChat/blob/main/images/个人中心.png)



## 2、工程结构模型

```
├── AppScope                  //全局公共资源
├── Features                  //各个组件
│   ├── BAAddressBookModule   //通讯录模块
│       └── src-main-ets      //ets代码
│           └── generated     //动态路由配置-自动生成
│           └── pages         //页面代码
│           └── view          
│           └── viewmodel
│   ├── BACommonModule        //公共组件
│   ├── BADiscoverModule      //发现模块
│           └── PYQ           //朋友圈         
│   ├── BAHomeModule          //主页模块
│   └── BAMineModule          //个人中心模块
│   └── BARouterModule        //动态路由模块
├── Product                   //主工程模块
│   └── entry                 //入口
├── hvigor                    //插件
├── libs                      //第三方库及插件
├── images                    //图片展示
└── oh_modules                
```





