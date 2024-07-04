import { BAStringUtil } from '@ohos/bacommonmodule'
import { ArrayList, JSON } from '@kit.ArkTS'

export enum BAAddressBookSectionType {
  default,
  top,
  myCompany,
  starFriend,
}

export class BAAddressBookViewModel {
  //获取通讯录数据
  static datas: BAAddressBookModel[] = [
    {
      type: BAAddressBookSectionType.top,
      sectionTitle: '',
      items: [
        {
          icon: $r('app.media.icon_friend_new'),
          name: "新的朋友",
          desc: ""
        },
        {
          icon: $r('app.media.icon_friend_onlyChat'),
          name: "仅聊天的朋友",
          desc: ""
        },
        {
          icon: $r('app.media.icon_chat_group'),
          name: "群聊",
          desc: ""
        },
        {
          icon: $r('app.media.icon_tag'),
          name: "标签",
          desc: ""
        },
        {
          icon: $r('app.media.icon_officialAccounts'),
          name: "公众号",
          desc: ""
        },
        {
          icon: $r('app.media.icon_companywx'),
          name: "企业微信联系人",
          desc: ""
        }
      ]
    },
    {
      type: BAAddressBookSectionType.myCompany,
      sectionTitle: '我的企业',
      items: [
        {
          icon: $r('app.media.icon_didi_chuxing'),
          name: "滴滴打车",
          desc: ""
        },
        {
          icon: $r('app.media.icon_didi_waimai'),
          name: "滴滴代驾",
          desc: ""
        }
      ]
    },
    {
      type: BAAddressBookSectionType.starFriend,
      sectionTitle: '※ 星标朋友',
      items: [
        {
          icon: $r('app.media.icon_jujingyi'),
          name: "鞠婧祎",
          desc: "我们做朋友吧！"
        },
        {
          icon: $r('app.media.icon_liuyifei'),
          name: "刘亦菲",
          desc: "主动加我的..."
        }
      ]
    },
    {
      type: BAAddressBookSectionType.default,
      sectionTitle: 'A',
      items: [
        {
          icon: $r('app.media.icon_jujingyi'),
          name: "阿猫",
          desc: ""
        },
        {
          icon: $r('app.media.icon_liuyifei'),
          name: "阿狗",
          desc: "汪汪汪..."
        }
      ]
    },
    {
      type: BAAddressBookSectionType.default,
      sectionTitle: 'B',
      items: [
        {
          icon: $r('app.media.icon_jujingyi'),
          name: "博爱",
          desc: ""
        },
        {
          icon: $r('app.media.icon_liuyifei'),
          name: "柏林",
          desc: ""
        }
      ]
    },
    {
      type: BAAddressBookSectionType.default,
      sectionTitle: 'F',
      items: [
        {
          icon: $r('app.media.icon_jujingyi'),
          name: "丰田",
          desc: ""
        },
        {
          icon: $r('app.media.icon_liuyifei'),
          name: "法拉利",
          desc: ""
        },
        {
          icon: $r('app.media.icon_liuyifei'),
          name: "福特",
          desc: ""
        }
      ]
    }
  ]

  static getIndexDatas(): Array<string> {
    let arrayList: Array<string> = new Array()
    arrayList.push('🔍')
    arrayList.push('※')

    let datas = BAAddressBookViewModel.datas
    for (let i = 0; i < datas.length; i++) {
      let sectionModel = datas[i]
      if (sectionModel.type == BAAddressBookSectionType.default &&
        !BAStringUtil.isStringEmpty(sectionModel.sectionTitle)) {
        arrayList.push(sectionModel.sectionTitle)
      }
    }
    return arrayList
  }
}

export interface BAAddressBookModel {
  type: BAAddressBookSectionType
  sectionTitle: string
  items?: BAAddressBookItem[] | undefined
}

export interface BAAddressBookItem {
  icon?: string | Resource
  name: string
  desc?: string
}
