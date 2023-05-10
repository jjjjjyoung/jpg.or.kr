var $ = jQuery;

$(function () {

    $('.tab .tablinks').click(function () {
        $('.tab .tablinks').removeClass('atv');
        $(this).addClass('atv');
    });

    
    $('#panel-2 .sns_thumb .sns_tit').append('<span class="bar"></span>');

    
    //공지사항

    $('.tabcontent > div:nth-of-type(1)').addClass('list1');
    $('.tabcontent > div:nth-of-type(2)').addClass('list2');
    $('.tabcontent > div:nth-of-type(3)').addClass('list3');
    $('.tabcontent > div:nth-of-type(4)').addClass('list4');
    $('.tabcontent > div:nth-of-type(5)').addClass('list5');

    $('#panel-3 .ntc_text p').addClass('ellipsis2');
    
}); //end jquery
