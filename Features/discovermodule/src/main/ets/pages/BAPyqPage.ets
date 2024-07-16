/**
 * @Class BAPyqPage.ets
 * @Author boai
 * @DateTime 2024/7/4 13:43:18
 */
import { BACommonConstants } from '@ohos/bacommonmodule'
import { BAPyqHeaderView } from '../view/BAPyqHeaderView'
import { BAPyqItemView } from '../view/BAPyqItemView'
import { BAPyqItemModel, BAPyqViewModel } from '../viewmodel/BAPyqViewModel'
// import { BADiscoverRouterPath } from '../generated/BADiscoverRouterPath'
import App from '@system.app'
import { BANavigationBar } from '@ohos/bacommonmodule/src/main/ets/view/BANavigationBar'
import { router } from '@kit.ArkUI'
import { XTEasyHUD } from '@jxt/xt_hud/src/main/ets/components/XTEasyHUD'
import { AppRouter } from '@ohos/dynamicsrouter'


@AppRouter({name: "discovermodule/BAPyqPage"})
// @Entry({ routeName: BADiscoverRouterPath.ROUTERPATH_DISCOVER_PYQ })
@Component
export struct BAPyqPage {
  //code
  @State simpleList: Array<BAPyqItemModel> = BAPyqViewModel.getDatas;
  @State showTitle: boolean = false
  @State navBarBgColor: string = ""
  private listScroller = new Scroller()
  private offsetY: number = 0

  @Builder
  pyqHead() {
    BAPyqHeaderView()
      .width(BACommonConstants.PERCENT_FULL)
      .height('35%')
    // .backgroundColor($r('app.color.list_background'))
  }

  build() {
    Stack() {

      List({ scroller: this.listScroller }) {
        ListItemGroup({ header: this.pyqHead() }) {
          // ForEach(BAPyqViewModel.getDatas, (itemModel: BAPyqItemModel, index?: number) => {
          //   ListItem() {
          //     BAPyqItemView({ itemModel: itemModel })
          //   }
          // })
          Repeat<BAPyqItemModel>(this.simpleList)
            .each((obj: RepeatItem<BAPyqItemModel>) => {
              BAPyqItemView({ itemModel: obj.item })
            })
            .key((itemModel: BAPyqItemModel) => itemModel.contentId.toString())
        }
        .divider({
          strokeWidth: 1,
          // color: $r('app.color.list_divider'),
          startMargin: 0,
          endMargin: 0
        }) // 每行之间的分界线
      }
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.offsetY = this.listScroller.currentOffset().yOffset
        // if (this.offsetY < 0) {
        //   this.scaleValue = (Math.abs(this.offsetY) + 100) / 100;
        // } else {
        //   this.scaleValue = 1
        // }
        if (this.offsetY >= BACommonConstants.NAVIGATIONBAR_HEIGHT) {
          this.offsetY = BACommonConstants.NAVIGATIONBAR_HEIGHT
        }
        let opNav = this.offsetY / BACommonConstants.NAVIGATIONBAR_HEIGHT
        this.navBarBgColor = `rgba(255,255,255,${opNav})`
        this.showTitle = opNav >= 0.3
      })
      // .layoutWeight(2)

      BANavigationBar({
        // leftIcon: $r('app.media.icon_back'),
        title: this.showTitle ? '朋友圈' : '',
        rightIcon: $r('app.media.icon_camera'),
        navBarBgColor: this.navBarBgColor,
        onBackClick: () => {
          // router.back()
        },
        onRightButtonClick: () => {
          // XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
        }
      })
        .width(BACommonConstants.PERCENT_FULL)
        .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    .backgroundColor(Color.White)
    .alignContent(Alignment.TopStart)
  }
}