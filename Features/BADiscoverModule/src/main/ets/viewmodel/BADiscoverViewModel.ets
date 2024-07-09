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
        id: 10001,
        itemType: BADiscoverItemType.pyq,
        icon: $r('app.media.icon_pyq'),
        title: '朋友圈',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        id: 10002,
        itemType: BADiscoverItemType.video,
        icon: $r('app.media.icon_video'),
        title: '视频号',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        id: 10003,
        itemType: BADiscoverItemType.live,
        icon: $r('app.media.icon_live'),
        title: '直播',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        id: 10004,
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_scan'),
        title: '扫一扫',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        id: 10005,
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_music'),
        title: '听一听',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        id: 10006,
        itemType: BADiscoverItemType.look,
        icon: $r('app.media.icon_kyk'),
        title: '看一看',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        id: 10007,
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_sys'),
        title: '搜一搜',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        id: 10008,
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_fujin'),
        title: '附近',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        id: 10009,
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_mall'),
        title: '购物',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      },
      {
        id: 10010,
        itemType: BADiscoverItemType.game,
        icon: $r('app.media.icon_game'),
        title: '游戏',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ],
    [
      {
        id: 10011,
        itemType: BADiscoverItemType.default,
        icon: $r('app.media.icon_program'),
        title: '小程序',
        isShowRightArrow: true,
        rightIcon: undefined,
        rightText: '',
        routerUrl: ''
      }
    ]
  ]
}

export interface BADiscoverViewItem {
  id: number
  itemType: BADiscoverItemType
  icon: Resource | string
  title: string
  isShowRightArrow: boolean
  rightIcon: Resource | string | undefined
  rightText: string
  routerUrl: string
}