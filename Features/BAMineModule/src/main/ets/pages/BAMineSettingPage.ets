/**
 * @Class BAMineSettingPage.ets
 * @Author boai
 * @DateTime 2024/7/16 10:19:38
 */
import { BACommonConstants } from '@ohos/bacommonmodule'
import { AppRouter } from '@ohos/dynamicsrouter'

@AppRouter({name: "baminemodule/BAMineSettingPage"})
@Component
export struct BAMineSettingPage {
  //code

  build() {
    Column() {
      Text('设置')
        .margin({top: 100})
        .alignSelf(ItemAlign.Center)
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}