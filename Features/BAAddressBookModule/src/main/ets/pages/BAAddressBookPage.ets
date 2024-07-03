import { XTEasyHUD } from '@jxt/xt_hud/src/main/ets/components/XTEasyHUD';
import { BACommonConstants, BALogger, BANavigationBarTitle } from '@ohos/bacommonmodule';
import { BAAddressBookItemView } from '../view/BAAddressBookItemView';
import {
  BAAddressBookItem,
  BAAddressBookModel,
  BAAddressBookSectionType,
  BAAddressBookViewModel
} from '../viewmodel/BAAddressBookViewModel';

@Entry
@Component
export struct BAAddressBookPage {
  @State searchText: string = ''
  // @State enterTypes: Array<EnterKeyType> = [EnterKeyType.Go, EnterKeyType.Search, EnterKeyType.Send, EnterKeyType.Done, EnterKeyType.Next, EnterKeyType.PREVIOUS, EnterKeyType.NEW_LINE]
  controller: SearchController = new SearchController()

  build() {
    Column() {
      BAAddressBookNavi()
        .width(BACommonConstants.PERCENT_FULL)
        .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)

      Search({ placeholder: '搜索', value: this.searchText, controller: this.controller })
        .width('94%')
        .height(44)
        .backgroundColor('#F5F5F5')
        .padding({ left: 8, right: 8 })
        .enterKeyType(EnterKeyType.Go)
        .onChange((value: string) => {
          this.searchText = value
        })
        .onSubmit((value: string) => {
          BALogger.info("trigger search onsubmit" + value, 'BAAddressBookPage')
        })

      BAAddressBookList()
        .width(BACommonConstants.PERCENT_FULL)
        .height('calc(100% - 64vp - 44vp - 49vp)')
      // .height('83%')
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}

@Component
struct BAAddressBookNavi {
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
        Image($r('app.media.icon_friend_add'))
          .width(28)
          .height(28)
          .objectFit(ImageFit.Auto)
          .margin({ right: 20 })
          .onClick(() => {
            XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
          })
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
struct BAAddressBookList {
  @Builder
  itemHead(text: string) {
    Row() {
      Text(text)
        .fontSize(16)
        .margin({ left: 16 })
    }
    .backgroundColor($r('app.color.list_background'))
    .width(BACommonConstants.PERCENT_FULL)
    .height(40)
  }

  isShowHeader(sectionModel: BAAddressBookModel): boolean {
    let isShowHeader: boolean = sectionModel.type != BAAddressBookSectionType.top
    return isShowHeader
  }

  build() {
    Column() {
      List({ space: 0 }) {
        ForEach(BAAddressBookViewModel.datas, (sectionModel: BAAddressBookModel, section?: number) => {
          ListItemGroup({
            header: this.isShowHeader(sectionModel) ? this.itemHead(sectionModel.sectionTitle) : undefined
          }) {
            ForEach(sectionModel.items, (itemModel: BAAddressBookItem, row?: number) => {
              BAAddressBookItemView({ itemModel: itemModel })
                .width(BACommonConstants.PERCENT_FULL)
                .height(60)
            })
          }
          .divider({
            strokeWidth: 1,
            color: ($r('app.color.list_divider'))
          })
        })
      }
      .layoutWeight(1)
      .listDirection(Axis.Vertical)
    }
    .backgroundColor($r('app.color.list_background'))
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}