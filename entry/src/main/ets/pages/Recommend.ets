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
    "https://images.pexels.com/photos/235621/pexels-photo-235621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/164745/pexels-photo-164745.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/167092/pexels-photo-167092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  ]

  dailyRecommend: RecommendDailyType[] = [
    {
      img: "https://images.pexels.com/photos/235621/pexels-photo-235621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      type: "每日推荐",
      top: '#660000',
      bottom: '#ff32382e'
    },
    {
      img: "https://images.pexels.com/photos/164745/pexels-photo-164745.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      type: "每日推荐",
      top: '#ff663000',
      bottom: '#ff2e3738'
    },
    {
      img: "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      type: "每日推荐",
      top: '#ff420066',
      bottom: '#ff2e382f'
    },
    {
      img: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      type: "每日推荐",
      top: '#ff662900',
      bottom: '#ff382e31'
    },
    {
      img: "https://images.pexels.com/photos/167092/pexels-photo-167092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      type: "每日推荐",
      top: '#ff00663a',
      bottom: '#ff38352e'
    }
  ]

  recommendList: RecommendListType[] = [
    {
      img: "https://images.pexels.com/photos/167092/pexels-photo-167092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      count: "270.9万"
    },
    {
      img: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      count: "489.2万"
    },
    {
      img: "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      count: "2398.2万"
    },
    {
      img: "https://images.pexels.com/photos/164745/pexels-photo-164745.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      count: "2134.2万"
    },
    {
      img: "https://images.pexels.com/photos/235621/pexels-photo-235621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      title: "每日推荐 | 今天从《不得不爱》听起 | 私人雷达",
      count: "882.6万"
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