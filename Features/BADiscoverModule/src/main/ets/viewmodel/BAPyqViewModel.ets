/**
 * @Class BAPyqViewModel.ets
 * @Author boai
 * @DateTime 2024/7/4 15:54:10
 */

export enum BAPyqItemType {
  default,
  ad
}

export class BAPyqViewModel {
  //code
  static getDatas: BAPyqItemModel[] = [
    {
      type: BAPyqItemType.default,
      contentId: 100001,
      userIcon: $r('app.media.icon_jujingyi'),
      userName: '鞠婧祎',
      content: "超聚光伸缩摄像头，实力出镜，开启专属仪式感；\n1 英寸大底传感器，超大进光量，捕捉瞬息精彩；\n超聚光微距长⁠焦，F2.1 超大光圈，35x 超级微距⁠1，探索未见之美。",
      images: undefined,
      video: undefined,
      time: '2024-7-3 9:43:39',
      urlPath: undefined,
      contentSource: undefined,
      comments: []
    },
    {
      type: BAPyqItemType.default,
      contentId: 100002,
      userIcon: $r('app.media.icon_liuyifei'),
      userName: '刘亦菲',
      content: "Pura，是一次新生 源自纯粹  生而独特 以大胆想象  探索未见之美 以先锋视角  打开全新视界以独创风格  引领时尚风向\nHUAWEI Pura 追逐本心  锐意向前",
      images: undefined,
      video: undefined,
      time: '2024-6-18 18:38:49',
      urlPath: undefined,
      contentSource: undefined,
      comments: []
    },
    {
      type: BAPyqItemType.default,
      contentId: 100001,
      userIcon: $r('app.media.icon_jujingyi'),
      userName: '鞠婧祎',
      content: "星芒纹，撷漫天星光，于手中绽放；\n高定刺绣压纹工艺，精细雅致，一触倾心。\n全新风向标设计，饰以专属 XMAGE 影像徽标，引领艺术新风向。",
      images: undefined,
      video: undefined,
      time: '2024-6-16 15:26:18',
      urlPath: undefined,
      contentSource: undefined,
      comments: []
    }
  ]
}

export interface BAPyqItemModel {
  type: BAPyqItemType
  contentId: number
  userIcon: Resource | undefined
  userName: string | undefined
  content: string | undefined
  images: Resource[] | string[] | undefined
  video: Resource | string | undefined
  time: string | undefined
  urlPath: string | undefined
  contentSource: string | undefined
  comments: BAPyqItemCommentModel[]
}

export interface BAPyqItemCommentModel {
  contentId: number
  commentId: number
  userName: number
  content: string | undefined
}



