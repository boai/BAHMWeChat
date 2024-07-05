/**
 * @Class BARouterPath.ets
 * @Author boai
 * @DateTime 2024/7/4 18:48:56
 */

export class BARouterPath {

  static readonly HOST_APP = 'baapp'
  static readonly HOST_H5 = 'bah5'
  static readonly HOST_MINIPROJECT = 'baminiProject'

  //获取路由path-App
  static getAppRouterPath(path: string) {
    return String('http://' + BARouterPath.HOST_APP + path)
  }

  //获取路由path-h5
  static getH5RouterPath(path: string) {
    return String('http://' + BARouterPath.HOST_H5 + path)
  }

  //获取路由path-miniProject
  static getMiniProjectRouterPath(path: string) {
    return String('http://' + BARouterPath.HOST_MINIPROJECT + path)
  }
}