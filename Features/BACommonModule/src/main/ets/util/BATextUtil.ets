/**
 * @Class BATextUtil.ets
 * @Author boai
 * @DateTime 2024/7/11 16:21:31
 */
import measure from '@ohos.measure';

export class BATextUtil {
  //code

  //计算文本高度
  static getTextSize(content: string | Resource, width: number, fontSize: number, maxLines?: number): SizeOptions {
    return measure.measureTextSize({
      textContent: content,
      constraintWidth: width,
      fontSize: fontSize,
      maxLines: maxLines
    })
  }


}