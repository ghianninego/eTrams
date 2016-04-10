$(document).ready(function () {

    (function ($) {

        $('#filterDataBtn').click(function () {

        	
            var rex;
            if($('#filterData').val() == "All"){
            	rex = new RegExp($('').val());
            }else{
            	rex = new RegExp($('#filterData').val());
            }
            
            $('#dataValues tr').hide();
            $('#dataValues tr').filter(function () {
                return rex.test($(this).text());
            }).show();

        })

    }(jQuery));

});