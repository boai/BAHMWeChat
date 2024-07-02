import { BACommonConstants } from '@ohos/bacommonmodule'
import { BADiscoverListItemView } from '../view/BADiscoverListItemView'
import { BADiscoverViewItem, BADiscoverViewModel } from '../viewmodel/BADiscoverViewModel'

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
        .width(BACommonConstants.PERSENT_FULL)
        .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)

      BADiscoverList()
        .width(BACommonConstants.PERSENT_FULL)
        .height("92%")

      // Column()
      //   // .backgroundColor(Color.Red)
      //   // .backgroundColor($r('app.color.list_background'))
      //   .width(BACommonConstants.PERSENT_FULL)
      //   .height(10)
    }
    .backgroundColor($r('app.color.list_background'))
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
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

      Column() {
        Text('发现')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .textAlign(TextAlign.Center)// .backgroundColor(Color.Yellow)
          .alignSelf(ItemAlign.Center)
          .width(BACommonConstants.PERSENT_FULL)
          .height(BACommonConstants.PERSENT_FULL)
      }
      .width('60%')
      .height(BACommonConstants.PERSENT_FULL)

      Row() {
        // Button()
        //   .backgroundColor(Color.Red)
        //   .width(44)
        //   .height(44)
        //   .margin({right: 20})
      }
      .width('20%')
      .justifyContent(FlexAlign.End)
    }
    .backgroundColor(Color.White)
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
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
                  .width(BACommonConstants.PERSENT_FULL)
                  .height(56)
              }
            })
          }
          .divider({
            strokeWidth: 0.5,
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
    .width(BACommonConstants.PERSENT_FULL)
    // .height(BACommonConstants.PERSENT_FULL)
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