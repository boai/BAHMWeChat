/**
 * @Class BAPyqPage.ets
 * @Author boai
 * @DateTime 2024/7/4 13:43:18
 */
import { BACommonConstants, BARouterPath } from '@ohos/bacommonmodule'
import { LYPyqHeaderView } from '../view/LYPyqHeaderView'
import { LYPyqItemView } from '../view/LYPyqItemView'
import { LYPyqItemModel, LYPyqViewModel } from '../viewmodel/LYPyqViewModel'
import { router } from '@kit.ArkUI'
import { BADiscoverRouterPath } from '../router/BADiscoverRouterPath'

const id_List = 'MultiDialogList';
const id_List_Item = 'MultiDialogListItem';

@Entry({routeName: BADiscoverRouterPath.ROUTERPATH_DISCOVER_PYQ})
@Component
export struct BAPyqPage {
  //code

  // datas: Array<string> = ['1', '2', '3']
  @State listHeight: number | string = 'auto';


  @Builder
  pyqHead() {
    LYPyqHeaderView()// .backgroundColor($r('app.color.list_background'))
      .width(BACommonConstants.PERCENT_FULL)
      .height('40%')
  }

  build() {
    Column() {
      List() {
        ListItemGroup({ header: this.pyqHead() }) {
          ForEach(LYPyqViewModel.getDatas, (itemModel: LYPyqItemModel, index?: number) => {
            ListItem() {
              LYPyqItemView({ itemModel: itemModel })
                .height(200)
                .margin({top: 20, bottom: 20})
            }
            .id(id_List_Item + index)
          })
        }
        .divider({
          strokeWidth: 1,
          // color: $r('app.color.list_divider'),
          startMargin: 60,
          endMargin: 0
        }) // 每行之间的分界线
      }
      .id(id_List)
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    .backgroundColor(Color.White)
  }
}