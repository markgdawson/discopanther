jQuery ->
  if $('body.band').lenght != 0
    #Storing page elements to local variables
    profileImages = $ 'img.profile'
    animateWidth = profileImages.first().width()+45
    profiles = $ 'div.profile'
    
    originalLeftEdgePosition = 0
    
    # Add Rollover Images
    profiles.each ->
      profileDiv = $(this).children('.profile')
      originalURL = profileDiv.attr('src').replace(/\.png/, '')
      clonedImg1 = profileDiv.clone().attr
        class: 'rollover'
        src : originalURL+2+'.png'

      clonedImg2 = profileDiv.clone().attr
        class: 'rollover'
        src : originalURL+3+'.png'
      
      clonedImg1.prependTo $(this)
      clonedImg2.prependTo $(this)

    # Add actions to rollovers
    profileImages.hover(
      ->
        originalLeftEdgePosition = $(this).position()["left"]
        rolloverImages = $(this).siblings 'img.rollover'
        
        rolloverImages.css({ left: originalLeftEdgePosition+'px'})
        
        if originalLeftEdgePosition > 500
          direction = -1
        else
          direction = 1
      
        rolloverImages.first().animate
          left: (originalLeftEdgePosition+direction*animateWidth)+'px'

        rolloverImages.last().animate
          left: (originalLeftEdgePosition+direction*animateWidth*2)+'px'

        $(this).siblings('.description').animate
          left : direction*5000+'px'
          opacity: 0
      ->
        originalLeftEdgePosition = $(this).position()["left"]
        rolloverImages = $(this).siblings 'img.rollover'

        rolloverImages.animate
          left: originalLeftEdgePosition+'px'

        $(this).siblings('.description').animate
          left : '0px'
          opacity: 1
    )