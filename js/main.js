$(function(){

    $('header a').click( function( event ){
        $( 'body, html' ).animate({ scrollTop: $( '#' + $(this).attr('href').replace(/^#/,'')).position().top - 10 - ( $('header').height() || 0 ) });
        event.stopImmediatePropagation();
        event.preventDefault();
        return false;
    });

    $(window).bind('scroll',function(event){
        var scrollTop = $( document ).scrollTop();
          
        // sidebar highlights current section
        $('header li.active').removeClass('active');
        $('article').each(function(){
            if( ( scrollTop + ( $( window ).height() * 0.5 ) ) > $(this).position().top && $(this).position().top ){
                $('header a[href=#'+$(this).attr('id')+']').parent().addClass('active');
            }
            $('header li.active').removeClass('active').last().addClass('active'); 
        });
    }).scroll();
});
