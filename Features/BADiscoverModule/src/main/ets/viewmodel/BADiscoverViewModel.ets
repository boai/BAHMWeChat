export enum BADiscoverItemType {
  default,
  pyq,
  video,
  live,
  look,
  game
}

export class BADiscoverViewModel {
  static datas: BADiscoverViewItem[][] = [
    [
      {
        itemType: BADiscoverItemType.pyq,
        icon: $r('app.media.icon_wx_collect'),
        title: '朋友圈',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        itemType: BADiscoverItemType.video,
        icon: $r('app.media.icon_wx_collect'),
        title: '视频号',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        itemType: BADiscoverItemType.live,
        icon: $r('app.media.icon_wx_collect'),
        title: '直播',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '扫一扫',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '听一听',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        itemType: BADiscoverItemType.look,
        icon: $r('app.media.icon_wx_collect'),
        title: '看一看',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '搜一搜',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '附近',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '购物',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        itemType: BADiscoverItemType.game,
        icon: $r('app.media.icon_wx_collect'),
        title: '游戏',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '小程序',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '小程序2',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_wx_collect'),
        title: '小程序3',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ]
  ]
}

export interface BADiscoverViewItem {
  itemType: BADiscoverItemType
  icon: Resource | string
  title: string
  isShowRightArrow: boolean
  rightIcon: Resource | string | undefined
  rightText: string
  routerUrl: string
}