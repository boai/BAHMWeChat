import { BATabbarModel } from './BATabbarModel'

export class BATabbarViewModel {

  //获取TabBar数据
  static getTabbarData(): Array<BATabbarModel> {
    return [
      {
        title: "微信",
        defaultIcon: $r('app.media.icon_tab_home'),
        selectedIcon: $r('app.media.icon_tab_home_hl')
      },
      {
        title: "通讯录",
        defaultIcon: $r('app.media.icon_tab_addressBook'),
        selectedIcon: $r('app.media.icon_tab_addressBook_hl')
      },
      {
        title: "发现",
        defaultIcon: $r('app.media.icon_tab_discover'),
        selectedIcon: $r('app.media.icon_tab_discover_hl')
      },
      {
        title: "我的",
        defaultIcon: $r('app.media.icon_tab_mine'),
        selectedIcon: $r('app.media.icon_tab_mine_hl')
      }
    ]
  }
}