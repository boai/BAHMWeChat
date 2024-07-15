/**
 * @Class BARouterInfo.ets
 * @Author boai
 * @DateTime 2024/7/15 09:16:41
 */

// 路由信息
export interface BARouterInfo {
  name: string
  pageModule: string
  registerFunction?: string
  pageSourceFile?: string
}

// 路由配置
export interface BARouterConfig {
  libPrefix: string
  mapPath: string
}

// 路由参数
export class BARouterParam {
  data?: Object
  model?: string
}

export namespace BARouterModel {
  export const Dialog: string = "dialog"
}

// 路由表
export class BARouterMapModel {
  routerMap: BARouterInfo[] = []
}

// 主页路由信息
export const HOME_PAGE: BARouterInfo = {
  name: "EntryView",
  pageModule: "entry",
  registerFunction: ""
}

