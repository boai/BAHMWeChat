# BAHMWeChat

鸿蒙版微信

## 1、应用截图

<img src="https://github.com/boai/BAHMWeChat/blob/main/images/个人中心.jpg" alt="个人中心" style="zoom:50%;" />

## 2、工程结构模型

. BAHMWeChat
├── AppScope                      //全局公共资源
├── Features                      //各个模块
│   ├── BAAddressBookModule // 通讯录模块
│   ├── BACommonModule      // 公共组件模块
│   ├── BADiscoverModule    // 发现模块
│   ├── BAHomeModule        // 主页模块
│   └── BAMineModule        // 个人中心模块
├── Product          
│   └── entry               // 入口模块
│       ├── oh_modules
│       │   └── @ohos
│       │       ├── baaddressbookmodule -> ../../../../Features/BAAddressBookModule
│       │       ├── bacommonmodule -> ../../../../Features/BACommonModule
│       │       ├── badiscovermodule -> ../../../../Features/BADiscoverModule
│       │       ├── bahomemodule -> ../../../../Features/BAHomeModule
│       │       └── baminemodule -> ../../../../Features/BAMineModule
│       └── src
│           ├── main
│           │   ├── ets
│           │   │   ├── entryability
│           │   │   ├── entrybackupability
│           │   │   ├── pages
│           │   │   └── viewModel
│           │   └── resources
│           ├── mock
│           └── test
├── images
└── oh_modules
├── @jxt
│   └── xt_hud -> ../.ohpm/@jxt+xt_hud@1.2.0/oh_modules/@jxt/xt_hud
├── @ohos
│   ├── hamock -> ../.ohpm/@ohos+hamock@1.0.0/oh_modules/@ohos/hamock
│   └── hypium -> ../.ohpm/@ohos+hypium@1.0.18/oh_modules/@ohos/hypium
└── @yunkss
└── eftool -> ../.ohpm/@yunkss+eftool@1.2.0/oh_modules/@yunkss/eftool

