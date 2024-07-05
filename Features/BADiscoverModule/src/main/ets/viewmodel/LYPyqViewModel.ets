/**
 * @Class LYPyqViewModel.ets
 * @Author boai
 * @DateTime 2024/7/4 15:54:10
 */

export enum LYPyqItemType {
  default,
  ad
}

export class LYPyqViewModel {
  //code
  static getDatas: LYPyqItemModel[] = [
    {
      type: LYPyqItemType.default,
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
      type: LYPyqItemType.default,
      contentId: 100001,
      userIcon: $r('app.media.icon_jujingyi'),
      userName: '鞠婧祎',
      content: "Pura，是一次新生 源自纯粹  生而独特 以大胆想象  探索未见之美 以先锋视角  打开全新视界以独创风格  引领时尚风向\nHUAWEI Pura 追逐本心  锐意向前",
      images: undefined,
      video: undefined,
      time: '2024-6-16 15:26:18',
      urlPath: undefined,
      contentSource: undefined,
      comments: []
    }
  ]
}

export interface LYPyqItemModel {
  type: LYPyqItemType
  contentId: number
  userIcon: Resource | undefined
  userName: string | undefined
  content: string | undefined
  images: Resource[] | string[] | undefined
  video: Resource | string | undefined
  time: string | undefined
  urlPath: string | undefined
  contentSource: string | undefined
  comments: LYPyqItemCommentModel[]
}

export interface LYPyqItemCommentModel {
  contentId: number
  commentId: number
  userName: number
  content: string | undefined
}



