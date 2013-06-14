jQuery ->
    $('.media_player').ttwMusicPlayer(
      [
         mp3:'/songs/paint_the_toon.mp3'
         title:'Paint The Toon'
         artist:'6ix Toys'
         duration:'3:40'
      ,
         mp3:'/songs/there_it_is.mp3'
         title:'There It Is'
         duration:'5:00'
      ],
      autoPlay:false,
      jPlayer:
          swfPath:'Jplayer'
    )
