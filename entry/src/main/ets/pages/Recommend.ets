interface RecommendDailyType {
  img: string
  title: string
  type: string
  top: string
  bottom: string
}

interface RecommendListType {
  img: string
  title: string
  count: string
}


@Component
export struct Recommend {

  swiperList: string[] = [
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner1.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner2.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner3.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner4.png",
    "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/banner5.png"
  ]

  dailyRecommend: RecommendDailyType[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend1.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '每日推荐',
      top: '#660000',
      bottom: '#382e2f'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend2.png',
      title: '从 [Nothing on Me] 开启无限漫游',
      type: '私人漫游',
      top: '#382e2f',
      bottom: '#a37862'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend3.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '华语流行',
      top: '#a37862',
      bottom: '#174847'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/recommend4.png',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      type: '私人雷达',
      top: '#174847',
      bottom: '#174847'
    }
  ]

  recommendList: RecommendListType[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list1.jpg',
      title: '每日推荐 | 今天从《不得不爱》听起 | 私人雷达',
      count: '270.9万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list2.jpg',
      title: 'Yasuo和更多好听的 | 华语私人雷达 | 回忆8090',
      count: '476.1万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list3.jpg',
      title: 'Trap Remix丨当欧美热单遇上毒性低音',
      count: '186.3万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list4.jpg',
      title: '满级人类进化之路必备BGM | 根本停不下来',
      count: '186.3万'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/list5.jpg',
      title: '认真去聆听这个世界的每一分每一秒 (强烈推荐)',
      count: '362.8万'
    }
  ]

  @Builder
  titleBuilder(title: string) {
    Row() {
      Text(title)
        .fontColor('#FFF')
        .fontWeight(700)
        .layoutWeight(1)
      Image($r('app.media.ic_more'))
        .width(22)
        .fillColor('#FFF')
    }
    .width('100%')
    .height(40)
  }

  build() {
    Column({space: 10}) {
      Row() {
        Image($r('app.media.ic_search'))
          .width(22)
          .fillColor('#817D83')
        TextInput({ placeholder: "sad"})
          .placeholderColor('#817D83')
          .padding({left: 5})
          .fontColor('#999')
          .layoutWeight(1)
        Image($r('app.media.ic_code'))
          .width(20)
          .fillColor('#817D83')
      }
      .width('100%')
      .backgroundColor('#2D2B29')
      .border({ radius: 20 })
      .padding({left: 8, right: 8})

      Swiper() {
        ForEach(this.swiperList, (item: string) => {
          Image(item)
            .width('100%')
            .height(200)
            .border({radius:10})
        })
      }
      .autoPlay(true)

      this.titleBuilder('每日推荐')
      List() {
        ForEach(this.dailyRecommend,(item: RecommendDailyType) => {
          ListItem() {
            Column() {
              Text(item.type)
                .width('100%')
                .height(40)
                .backgroundColor(item.top)
                .padding({left:5})
                .fontSize(14)
                .fontColor('#FFF')
              Image(item.img)
                .width('100%')
                .height(120)
              Text(item.title)
                .width('100%')
                .backgroundColor(item.bottom)
                .padding(5)
                .fontSize(14)
                .fontColor('#FFF')
                .maxLines(2)
                .textOverflow({overflow: TextOverflow.Ellipsis})
            }
            .width('40%')
            .border({ radius: 10 })
            .margin({ right: 10 })
            .clip(true)
          }
        })
      }
      .listDirection(Axis.Horizontal)
      .height(230)
      .scrollBar(BarState.Off)

      List() {
        ForEach(this.recommendList, (item: RecommendListType) => {
          ListItem() {
            Column(){
              Stack({alignContent: Alignment.TopStart}) {
                Image(item.img)
                  .width('100%')
                  .height(100)
                  .border({radius:8})
                Text(item.count)
                  .fontColor('#fff')
                  .fontSize(12)
                  .fontWeight(700)
                  .margin(5)
              }
              Text(item.title)
                .width('100%')
                .padding(5)
                .fontSize(14)
                .fontColor('#FFF')
                .maxLines(2)
                .textOverflow({overflow: TextOverflow.Ellipsis})
            }
            .width('30%')
            .height(200)
            .margin({right: 10})
          }
        })
      }
      .listDirection(Axis.Horizontal)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 10, right: 10, top: 5, bottom: 5})
  }
}