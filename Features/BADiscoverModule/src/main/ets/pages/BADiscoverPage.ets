import { XTEasyHUD } from '@jxt/xt_hud'
import { BACommonConstants, BANavigationBarTitle, BARouter, BARouterPath } from '@ohos/bacommonmodule'
import { BADiscoverListItemView } from '../view/BADiscoverListItemView'
import { BADiscoverItemType, BADiscoverViewItem, BADiscoverViewModel } from '../viewmodel/BADiscoverViewModel'
import { BADiscoverRouterPath } from '../router/BADiscoverRouterPath'

@Entry
@Component
export struct BADiscoverPage {
  // // 进入案例时设置状态栏颜色
  // aboutToAppear(): void {
  //   setStatusBar(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
  // }
  //
  // // 退出案例时设置状态栏颜色，避免影响其他案例。
  // aboutToDisappear(): void {
  //   setStatusBar(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
  // }

  build() {
    Column() {
      BADiscoverNavi()
        .width(BACommonConstants.PERCENT_FULL)
        .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)

      BADiscoverList()
        .width(BACommonConstants.PERCENT_FULL)
        .height('calc(100% - 64vp)')

      // Column()
      //   // .backgroundColor(Color.Red)
      //   // .backgroundColor($r('app.color.list_background'))
      //   .width(BACommonConstants.PERCENT_FULL)
      //   .height(10)
    }
    .backgroundColor($r('app.color.list_background'))
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }
}

@Component
struct BADiscoverNavi {
  build() {
    Row() {
      Column() {
      }
      .width("20%")
      .layoutWeight(2)

      BANavigationBarTitle({ title: '发现' })
        .width('60%')
        .height(BACommonConstants.PERCENT_FULL)
        .layoutWeight(1)

      Row() {
        // Button()
        //   .backgroundColor(Color.Red)
        //   .width(44)
        //   .height(44)
        //   .margin({right: 20})
      }
      .width('20%')
      .justifyContent(FlexAlign.End)
      .layoutWeight(2)
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}

@Component
struct BADiscoverList {
  build() {
    Column() {
      List({ space: 10, initialIndex: 0 }) {
        ForEach(BADiscoverViewModel.datas, (items: BADiscoverViewItem[], section?: number) => {
          ListItemGroup() {
            ForEach(items, (item: BADiscoverViewItem, row?: number) => {
              ListItem() {
                BADiscoverListItemView({ item: item })
                  .width(BACommonConstants.PERCENT_FULL)
                  .height(56)
                  .onClick(() => {
                    if (item.itemType == BADiscoverItemType.pyq) {
                      // 通过 BARouter 跳转
                      BARouter.openUrl(BARouterPath.getAppRouterPath(BADiscoverRouterPath.ROUTERPATH_DISCOVER_PYQ))
                    } else {
                      XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
                    }
                  })
              }
            })
          }
          .divider({
            strokeWidth: 1,
            color: $r('app.color.list_divider'),
            startMargin: 60,
            endMargin: 0
          }) // 每行之间的分界线
        })
      }
      .layoutWeight(1)
      .listDirection(Axis.Vertical) // 排列方向
    }
    .backgroundColor($r('app.color.list_background'))
    .width(BACommonConstants.PERCENT_FULL)

    // .height(BACommonConstants.PERCENT_FULL)
  }
}


// async function setStatusBar(currentMode: number): Promise<void> {
//   // 获取应用主窗口。
//   let windowClass: window.Window;
//   const windowStage: window.WindowStage = AppStorage.get(STRINGCONFIGURATION.TABCONTENT_OVERFLOW_WINDOW_STAGE) as window.WindowStage;
//   windowStage.getMainWindow((err, data) => {
//     if (err.code) {
//       logger.error('Failed to get Main Window. Cause: ' + JSON.stringify(err));
//       return;
//     }
//     windowClass = data;
//     let statusBarColor = '';
//     let statusBarContentColor = '';
//     if (currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK) {
//       statusBarColor = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_BLACK;
//       statusBarContentColor = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_WHITE;
//     } else {
//       statusBarColor = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_WHITE;
//       statusBarContentColor = STRINGCONFIGURATION.TABCONTENT_OVERFLOW_BLACK;
//     }
//     const sysBarProps: window.SystemBarProperties = {
//       statusBarColor: statusBarColor, // 状态栏背景颜色
//       statusBarContentColor: statusBarContentColor  // 状态栏文字颜色
//     };
//     // TODO: 知识点：调用setWindowSystemBarProperties()设置状态栏的颜色
//     windowClass.setWindowSystemBarProperties(sysBarProps, (err: BusinessError) => {
//       const errCode: number = err.code;
//       if (errCode) {
//         // logger.error('Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
//         return;
//       }
//     });
//   })
// }