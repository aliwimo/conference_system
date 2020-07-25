$(document).ready(function () {
    getJudgesCount();
    getJudgesNames();
    makeTime();
    $('input[id*="judge"]').on('click', function () {
        getJudgesNames();
        if (getJudgesCount() < 3) {
            $("#judgesSubmit").attr("disabled", true);
        } else {
            $("#judgesSubmit").attr("disabled", false);
        }
    });

    $('#reportFields').on('click', function () {
        $('#fieldsNames').val($(this).val().join(","));
    });


    $('#endTimeInput').on('click', function () {
    	if($('#endTimeInput').val() > 10 ||  $('#endTimeInput').val() < 1) {
    		
    	} else {
            makeTime();
    	}
    });
});

function getJudgesCount() {
    var judgeCount = 0;
    $('input[id*="judge"]:checked').each(function () {
		judgeCount++;
	});
    return judgeCount;
}

function getJudgesNames() {
    var judgeNames = [];
    var judgesString = "";
    $('input[id*="judge"]:checked').each(function () {
		judgeNames.push($(this).val());
    });
    judgesString = judgeNames.join(",");
    $('#judNames').val(judgesString);
}

function makeTime() {
    var currentdate = new Date(); 
    var datetime = currentdate.getFullYear() + "-"
                if (currentdate.getDate()+parseInt($('#endTimeInput').val()) > 31) {
                    
                    datetime = datetime + (currentdate.getMonth()+2)  + "-";
                    datetime = datetime + (currentdate.getDate()+parseInt($('#endTimeInput').val()) - 31);
                } else {
                    datetime = datetime + (currentdate.getMonth()+1)  + "-";
                    datetime = datetime + currentdate.getDate()+parseInt($('#endTimeInput').val());
                }
                $('#showTime2').text(datetime);
                datetime = datetime + "T" 
                + currentdate.getHours() + ":"  
                + currentdate.getMinutes();
    $('#showTime').val(datetime);
}