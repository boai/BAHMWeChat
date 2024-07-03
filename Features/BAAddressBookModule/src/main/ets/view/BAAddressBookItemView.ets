import { BACommonConstants } from '@ohos/bacommonmodule'
import { BAAddressBookItem, BAAddressBookModel } from '../viewmodel/BAAddressBookViewModel'

@Entry
@Component
export struct BAAddressBookItemView {
  @BuilderParam itemModel: BAAddressBookItem

  build() {
    Row() {
      Image(this.itemModel.icon)
        // .backgroundColor(Color.Red)
        .width(40)
        .height(40)
        .margin({ left: 16 })
        .objectFit(ImageFit.Auto)
        .borderRadius(6)

      if (this.itemModel.desc === undefined || this.itemModel.desc?.length === 0) {
        Text(this.itemModel.name)
          .fontSize(16)
          .margin({ left: 16 })
      } else {
        Column() {
          Text(this.itemModel.name)
            .fontSize(16)
            .margin({ left: 16 })

          Text(this.itemModel.desc)
            .fontSize(14)
            .fontColor(Color.Gray)
            .margin({ top: 4, left: 16 })
        }
        .alignItems(HorizontalAlign.Start)
      }
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
    .backgroundColor(Color.White)
  }
}

// @Component
// export struct BAAddressBookSectionHeaderView {
//   @BuilderParam sectionModel: BAAddressBookModel
//
//   build() {
//     Column() {
//       Text(this.sectionModel.sectionTitle)
//         .fontSize(14)
//         .fontColor(Color.Gray)
//     }
//   }
// }