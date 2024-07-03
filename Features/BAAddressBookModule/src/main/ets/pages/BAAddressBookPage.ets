import { BACommonConstants } from '@ohos/bacommonmodule';
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
  build() {
    Column() {
      BAAddressBookNavi()
        .width(BACommonConstants.PERCENT_FULL)
        .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)

      BAAddressBookList()
        .width(BACommonConstants.PERCENT_FULL)
        .height(BACommonConstants.PERCENT_EXCEPT_TABBARANDNAVI)
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

      Column() {
        Text('通讯录')
          .fontSize(24)
          .fontWeight(FontWeight.Medium)
          .textAlign(TextAlign.Center)// .backgroundColor(Color.Yellow)
          .alignSelf(ItemAlign.Center)
          .width(BACommonConstants.PERCENT_FULL)
          .height(BACommonConstants.PERCENT_FULL)
      }
      .width('60%')
      .height(BACommonConstants.PERCENT_FULL)

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