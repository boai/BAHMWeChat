import { BACommonConstants } from '@ohos/bacommonmodule'
import { BATabbarModel } from '../viewModel/BATabbarModel'
import { BATabbarViewModel } from '../viewModel/BATabbarViewModel'
import { BAAddressBookIndex } from './BAAddressBookIndex'
import { BADiscoverIndex } from './BADiscoverIndex'
import { BAHomeIndex } from './BAHomeIndex'
import { BAMineIndex } from './BAMineIndex'

@Entry
@Component
export struct BATabbarIndex {

  @State currentPageIndex: number = 0
  @State tabData: Array<BATabbarModel> = BATabbarViewModel.getTabbarData()

  @Builder
  tabbarBuilder(item: BATabbarModel, index: number | undefined) {
    Column() {
      Image(this.currentPageIndex === index ? item.selectedIcon : item.defaultIcon)
        .width(24)
        .height(24)
      Text(item.title)//"#1AAD19"
        .fontColor(this.currentPageIndex === index ? $r('app.color.theme') : Color.Gray)
        .fontSize(12)
        .margin({ top: 4 })
        .opacity(this.currentPageIndex === index ? 1 : 0.7)
    }
    .justifyContent(FlexAlign.Center)
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: this.currentPageIndex }) {
        ForEach(this.tabData, (item: BATabbarModel, index: number) => {
          TabContent() {
            if (index === 0) {
              BAHomeIndex()
            } else if (index === 1) {
              BAAddressBookIndex()
            } else if (index === 2) {
              BADiscoverIndex()
            } else if (index === this.tabData.length - 1) {
              BAMineIndex()
            }
          }
          .tabBar(this.tabbarBuilder(item, index))
        }, (item: BATabbarModel) => JSON.stringify(item))
      }
      .onChange((index: number) => {
        this.currentPageIndex = index
      })
    }
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
  }
}