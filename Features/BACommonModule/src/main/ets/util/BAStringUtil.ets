/**
 * @Class BAArrayUtil.ets
 * @Author boai
 * @DateTime 2024/7/4 09:37:54
 */

export class BAStringUtil {
  //字符串判空
  static isStringEmpty(str: string | undefined | null): boolean {
    return str == undefined || str == null || str.length == 0
  }
}