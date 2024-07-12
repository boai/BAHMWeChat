/**
 * @Class BAArrayUtil.ets
 * @Author boai
 * @DateTime 2024/7/4 09:37:54
 */
import { BusinessError } from '@kit.BasicServicesKit';

export class BAStringUtil {
  //字符串判空
  static isStringEmpty(str: string | undefined | null): boolean {
    return str == undefined || str == null || str.length == 0
  }

  // 字符串资源转换为字符串的方法
  // static getStringFromResource(component?: Object, source: Resource | string): string {
  //   try {
  //     if (typeof source === 'string') {
  //       return source;
  //     }
  //     return getContext(component).resourceManager.getStringSync(source);
  //   } catch (error) {
  //     let code = (error as BusinessError).code;
  //     let message = (error as BusinessError).message;
  //     console.log('getStringFromResource' + code + message);
  //     return '';
  //   }
  // }
}