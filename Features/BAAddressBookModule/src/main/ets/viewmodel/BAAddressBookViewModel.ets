
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
      sectionTitle: undefined,
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
      type: BAAddressBookSectionType.starFriend,
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
      type: BAAddressBookSectionType.starFriend,
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
    }
  ]
}

export interface BAAddressBookModel {
  type: BAAddressBookSectionType
  sectionTitle: string | undefined
  items?: BAAddressBookItem[] | undefined
}

export interface BAAddressBookItem {
  icon?: string | Resource
  name: string
  desc?: string
}
