import { XTEasyHUD } from '@jxt/xt_hud/src/main/ets/components/XTEasyHUD';
import { BABaseNaviContentView, BACommonConstants, BALogger, BANavigationBarTitle } from '@ohos/bacommonmodule';
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

  @Builder
  contentView() {
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
      .height('calc(100% - 64vp)')
    // .height('83%')
  }

  build() {
    Column() {
      BABaseNaviContentView({
        title: '通讯录',
        rightIcon: $r('app.media.icon_friend_add'),
        contentView: this.contentView
      })
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}

@Component
struct BAAddressBookList {
  private listScroller: Scroller = new Scroller()
  @State selectedIndex: number = 0
  private indexValues: string[] = BAAddressBookViewModel.getIndexDatas()

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
    Stack({ alignContent: Alignment.End }) {
      List({ space: 0, scroller: this.listScroller }) {
        // ForEach(BAAddressBookViewModel.datas, (sectionModel: BAAddressBookModel, section?: number) => {
        //   ListItemGroup({
        //     header: this.isShowHeader(sectionModel) ? this.itemHead(sectionModel.sectionTitle) : undefined
        //   }) {
        //     ForEach(sectionModel.items, (itemModel: BAAddressBookItem, row?: number) => {
        //       ListItem() {
        //         BAAddressBookItemView({ itemModel: itemModel })
        //           .width(BACommonConstants.PERCENT_FULL)
        //           .height(60)
        //           .onClick(() => {
        //             XTEasyHUD.showToast(BACommonConstants.TIP_FUNCTIONNOTDEVELOP)
        //           })
        //       }
        //     })
        //   }
        //   .divider({
        //     strokeWidth: 1,
        //     color: ($r('app.color.list_divider'))
        //   })
        // })

        Repeat<BAAddressBookModel>(BAAddressBookViewModel.datas)
          .each((sectionModel: RepeatItem<BAAddressBookModel>) => {
            ListItemGroup({
              header: this.isShowHeader(sectionModel.item) ? this.itemHead(sectionModel.item.sectionTitle) : undefined
            }) {
              Repeat<BAAddressBookItem>(sectionModel.item.items)
                .each((obj: RepeatItem<BAAddressBookItem>) => {
                  BAAddressBookItemView({ itemModel: obj.item })
                    .width(BACommonConstants.PERCENT_FULL)
                    .height(60)
                    .onClick(() => {
                      XTEasyHUD.showToast('点击了：' + obj.item.name)
                    })
                })
                .key((itemModel: BAAddressBookItem) => itemModel.id.toString())
            }
            .divider({
              strokeWidth: 1,
              color: $r('app.color.list_divider'),
              startMargin: 60,
              endMargin: 0
            }) // 每行之间的分界线
          })
        // .key((itemModel: BADiscoverViewItem) => itemModel.id.toString())
      }
      .layoutWeight(1)
      .listDirection(Axis.Vertical)
      .onScrollIndex((firstIndex: number) => {
        this.selectedIndex = firstIndex
      })

      AlphabetIndexer({ arrayValue: this.indexValues, selected: this.selectedIndex })
        .align(Alignment.End)
        .selectedColor(0xFFFFFF)// 选中项文本颜色
        .popupColor(0xFFFAF0)// 弹出框文本颜色
        .selectedBackgroundColor(0xCCCCCC)// 选中项背景颜色
        .popupBackground(0xD2B48C)// 弹出框背景颜色
        .usingPopup(true)// 是否显示弹出框
        .selectedFont({ size: 16, weight: FontWeight.Bolder })// 选中项字体样式
        .popupFont({ size: 30, weight: FontWeight.Bolder })// 弹出框内容的字体样式
        .itemSize(28)// 每一项的尺寸大小
        .alignStyle(IndexerAlign.Left)// 弹出框在索引条右侧弹出
        .popupItemBorderRadius(24)// 设置提示弹窗索引项背板圆角半径
        .itemBorderRadius(14)// 设置索引项背板圆角半径
        .popupBackgroundBlurStyle(BlurStyle.NONE)// 设置提示弹窗的背景模糊材质
        .popupTitleBackground(0xCCCCCC)// 设置提示弹窗首个索引项背板颜色
        .popupSelectedColor(0x00FF00)
        .popupUnselectedColor(0x0000FF)
        .popupItemFont({ size: 30, style: FontStyle.Normal })
        .popupItemBackgroundColor(0xCCCCCC)
        .onSelect((index: number) => {
          console.info(this.indexValues[index] + ' Selected!')
          this.listScroller.scrollToIndex(index)
        })
        .onRequestPopupData((index: number) => {
          // if (this.indexValues[index] == 'A') {
          //   return this.arrayA // 当选中A时，弹出框里面的提示文本列表显示A对应的列表arrayA，选中B、C、L时也同样
          // }
          return []
        })
        .onPopupSelect((index: number) => {
          console.info('onPopupSelected:' + index)
        })
    }
    .backgroundColor($r('app.color.list_background'))
    .width(BACommonConstants.PERCENT_FULL)
    // .height(BACommonConstants.PERCENT_FULL)
  }
}