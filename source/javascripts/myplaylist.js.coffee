jQuery ->
    $('.media_player').ttwMusicPlayer(
      [
         mp3:'songs/paint_the_toon.mp3'
         oga:'songs/paint_the_toon.ogg'
         title:'Paint The Toon'
         artist:'6ix Toys'
         duration:'0:30'
      ,
         mp3:'/songs/there_it_is.mp3'
         oga:'/songs/there_it_is.ogg'
         title:'There It Is'
         duration:'0:30'
      ],
      autoPlay:false,
      jPlayer:
          swfPath:'Jplayer'
    )