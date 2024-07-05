/**
 * @Class BAPyqPage.ets
 * @Author boai
 * @DateTime 2024/7/4 13:43:18
 */
import { BACommonConstants, BARouterPath } from '@ohos/bacommonmodule'
import { BAPyqHeaderView } from '../view/BAPyqHeaderView'
import { BAPyqItemView } from '../view/BAPyqItemView'
import { BAPyqItemModel, BAPyqViewModel } from '../viewmodel/BAPyqViewModel'
import { router } from '@kit.ArkUI'
import { BADiscoverRouterPath } from '../router/BADiscoverRouterPath'


@Entry({routeName: BADiscoverRouterPath.ROUTERPATH_DISCOVER_PYQ})
@Component
export struct BAPyqPage {
  //code
  @State simpleList: Array<BAPyqItemModel> = BAPyqViewModel.getDatas;

  @Builder
  pyqHead() {
    BAPyqHeaderView()// .backgroundColor($r('app.color.list_background'))
      .width(BACommonConstants.PERCENT_FULL)
      .height('40%')
  }

  build() {
    Column() {


      List() {
        ListItemGroup({ header: this.pyqHead() }) {
          // ForEach(BAPyqViewModel.getDatas, (itemModel: BAPyqItemModel, index?: number) => {
          //   ListItem() {
          //     BAPyqItemView({ itemModel: itemModel })
          //   }
          // })
          Repeat<BAPyqItemModel>(this.simpleList)
            .each((obj: RepeatItem<BAPyqItemModel>)=>{
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
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    .backgroundColor(Color.White)
  }
}