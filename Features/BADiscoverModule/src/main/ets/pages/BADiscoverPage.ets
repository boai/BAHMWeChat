import { XTEasyHUD } from '@jxt/xt_hud'
import {
  BABaseNaviContentView,
  BACommonConstants,
  BALogger,
  BARouterPath,
  BAScannerUtil
} from '@ohos/bacommonmodule'
import { BADiscoverListItemView } from '../view/BADiscoverListItemView'
import { BADiscoverItemType, BADiscoverViewItem, BADiscoverViewModel } from '../viewmodel/BADiscoverViewModel'
// import { BADiscoverRouterPath } from '../generated/BADiscoverRouterPath'
import { DynamicsRouter, AppRouter } from '@ohos/dynamicsrouter'
import { scanBarcode, scanCore } from '@kit.ScanKit'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { BusinessError } from '@kit.BasicServicesKit'

// @Entry
@AppRouter({ name: "badiscovermodule/BADiscoverPage" })
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

  @Builder
  contentView() {
    BADiscoverList()
  }

  build() {

    Column() {
      BABaseNaviContentView({
        title: '发现',
        contentView: this.contentView
      })
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}

@Component
struct BADiscoverList {
  @State dataList: Array<BADiscoverViewItem[]> = BADiscoverViewModel.datas

  build() {
    Column() {
      List({ space: 10, initialIndex: 0 }) {
        Repeat<BADiscoverViewItem[]>(this.dataList)
          .each((items: RepeatItem<BADiscoverViewItem[]>) => {
            ListItemGroup() {

              Repeat<BADiscoverViewItem>(items.item)
                .each((obj: RepeatItem<BADiscoverViewItem>) => {
                  BADiscoverListItemView({ item: obj.item })
                    .width(BACommonConstants.PERCENT_FULL)
                    .height(56)
                    .onClick(() => {
                      if (obj.item.itemType == BADiscoverItemType.pyq) {
                        // 通过 BARouter 跳转
                        // BARouter.openUrl(BARouterPath.getAppRouterPath(BADiscoverRouterPath.ROUTERPATH_DISCOVER_PYQ) + "?type=1&name=博爱")
                        DynamicsRouter.pushUri("badiscovermodule/BAPyqPage")
                      } else if (obj.item.id == 10004) {
                        //扫一扫
                        BAScannerUtil.onScan(getContext(this), { "pageType": "2" }, (result) => {
                          let a = result.scanType

                        })
                      } else {
                        XTEasyHUD.showToast(`点击了：${obj.item.title}`)
                      }
                    })
                })
                .key((itemModel: BADiscoverViewItem) => itemModel.id.toString())
            }
            .divider({
              strokeWidth: 1,
              color: $r('app.color.list_divider'),
              startMargin: 60,
              endMargin: 0
            }) // 每行之间的分界线
          })
        // .key((itemModel: BADiscoverViewItem) => itemModel.id.toString())

        // ForEach(BADiscoverViewModel.datas, (items: BADiscoverViewItem[], section?: number) => {
        //   ListItemGroup() {
        //     ForEach(items, (item: BADiscoverViewItem, row?: number) => {
        //       ListItem() {
        //         BADiscoverListItemView({ item: item })
        //           .width(BACommonConstants.PERCENT_FULL)
        //           .height(56)
        //           .onClick(() => {
        //             if (item.itemType == BADiscoverItemType.pyq) {
        //               // 通过 BARouter 跳转
        //               BARouter.openUrl(BARouterPath.getAppRouterPath(BADiscoverRouterPath.ROUTERPATH_DISCOVER_PYQ))
        //             } else {
        //               XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
        //             }
        //           })
        //       }
        //     })
        //   }
        //   .divider({
        //     strokeWidth: 1,
        //     color: $r('app.color.list_divider'),
        //     startMargin: 60,
        //     endMargin: 0
        //   }) // 每行之间的分界线
        // })
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