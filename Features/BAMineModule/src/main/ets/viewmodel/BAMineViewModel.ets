export class BAMineViewModel {
  static datas: BAMineViewArrObject[] = [
    {
      style: ListItemStyle.NONE,
      items: null
    },
    {
      style: ListItemStyle.NONE,
      items: [
        {
          icon: $r('app.media.icon_wx_service'),
          title: '服务',
          isShowRightArrow: true,
          routerUrl: ''
        }
      ]
    },
    {
      style: ListItemStyle.NONE,
      items: [
        {
          icon: $r('app.media.icon_wx_collect'),
          title: '收藏',
          isShowRightArrow: true,
          routerUrl: ''
        },
        {
          icon: $r("app.media.icon_wx_pengyq"),
          title: '朋友圈',
          isShowRightArrow: true,
          routerUrl: ''
        },
        {
          icon: $r('app.media.icon_wx_shiph'),
          title: '视频号',
          isShowRightArrow: true,
          routerUrl: ''
        },
        {
          icon: $r('app.media.icon_wx_card'),
          title: '卡包',
          isShowRightArrow: true,
          routerUrl: ''
        },
        {
          icon: $r('app.media.icon_wx_biaoq'),
          title: '表情',
          isShowRightArrow: true,
          routerUrl: ''
        },
      ]
    },
    {
      style: ListItemStyle.NONE,
      items: [
        {
          icon: $r('app.media.icon_wx_setting'),
          title: '设置',
          isShowRightArrow: true,
          routerUrl: ''
        }
      ]
    }
  ]
}

export interface BAMineViewArrObject {
  style: number
  items?: BAMineViewItem[] | null
}

export interface BAMineViewItem {
  icon: Resource | string
  title: string
  isShowRightArrow: boolean
  routerUrl: string
}