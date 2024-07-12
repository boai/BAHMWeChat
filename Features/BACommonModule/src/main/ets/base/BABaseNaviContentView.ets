/**
 * @Class BABaseNaviContentView.ets
 * @Author boai
 * @DateTime 2024/7/8 18:59:05
 */
import { BACommonConstants } from '../constants/BACommonConstants'
import { BANavigationBar } from '../view/BANavigationBar'

@Component
export struct BABaseNaviContentView {
  @Prop leftIcon?: Resource | undefined
  @Prop title?: string | undefined
  @Prop rightIcon?: Resource | undefined
  @Prop navBarBgColor?: string
  @BuilderParam onBackClick?: () => void
  @BuilderParam onRightButtonClick?: () => void

  @BuilderParam contentView: () => void

  //code
  build() {
    Column() {
      BANavigationBar({
        leftIcon: this.leftIcon,
        title: this.title,
        rightIcon: this.rightIcon,
        navBarBgColor: this.navBarBgColor,
        onBackClick: this.onBackClick,
        onRightButtonClick: this.onRightButtonClick
      })
        .width(BACommonConstants.PERCENT_FULL)
        .height(BACommonConstants.NAVIGATIONBAR_HEIGHT)

      Column() {
        this.contentView()
      }
      .width(BACommonConstants.PERCENT_FULL)
      .height('calc(100% - 64vp)')
    }
    .width(BACommonConstants.PERCENT_FULL)
    .height(BACommonConstants.PERCENT_FULL)
  }
}