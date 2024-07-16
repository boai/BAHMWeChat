import { DynamicsRouter } from '@ohos/dynamicsrouter';
import { BATabbarIndex } from './BATabbarIndex';

@Entry
@Component
struct EntryView {
  @State message: string = 'Hello World';

  @Builder
  pageMap(name: string, param: ESObject) {
    NavDestination() {
      // 根据模块名，获取WrappedBuilder对象，通过builder接口创建页面
      DynamicsRouter.getBuilder(name).builder(param);
    }
    // 按需将NavDestinationMode配置为DIALOG类型，此时背景默认透明
    .mode(name === "multimodaltransion/HalfModalWindow" ?
    NavDestinationMode.DIALOG : NavDestinationMode.STANDARD)
    .hideTitleBar(true)
  }

  build() {

    // Column() {
      Navigation(DynamicsRouter.navPathStack) {
        Column() {
          BATabbarIndex()
        }
        .height('100%')
        .width('100%')
      }
      .hideTitleBar(true)
      .navDestination(this.pageMap)

    // .mode(NavigationMode.Split) // 视频全屏案例横屏时使用NavigationMode.Split模式显示。
    // }
    // .alignContent(Alignment.BottomEnd)
    // .width('100%')
    // .height('100%')
  }
}