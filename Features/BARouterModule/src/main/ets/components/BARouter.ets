/**
 * @Class BARouter.ets
 * @Author boai
 * @DateTime 2024/7/12 16:22:51
 */

// 自定义装饰器
export function BARouter(param: BARouterParam) {
  return Object
}

// 装饰器参数
export interface BARouterParam {
  // 跳转的路由名
  name: string
  // 是否需要传递参数，需要的话设置为true，否则可不需要设置。
  hasParam?: boolean
}
