/**
 * @Class BAPersonDetailPage.ets
 * @Author boai
 * @DateTime 2024/7/16 09:52:14
 */
import { BACommonConstants } from '@ohos/bacommonmodule'
import { AppRouter } from '@ohos/dynamicsrouter'

@AppRouter({name: "baaddressbookmodule/BAPersonDetailPage"})
@Component
export struct BAPersonDetailPage {
  //code
  build() {
    Column() {
      Text('详情')
        .margin({top: 100})
        .alignSelf(ItemAlign.Center)
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}