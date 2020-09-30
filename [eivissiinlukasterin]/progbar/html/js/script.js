$('document').ready(function() {
    MythicProgBar = {};

    MythicProgBar.Progress = function(data) {
        $(".progress-container").css({"display":"block"});
        $("#progress-label").text(data.label);
        $("#progress-bar").stop().css({"width": 0, "background-color": "#007CD799"}).animate({
          width: '100%'
        }, {
          duration: parseInt(data.duration),
          complete: function() {
            $(".progress-container").css({"display":"none"});
            $("#progress-bar").css("width", 0);
            $.post('http://el1te_progbar/actionFinish', JSON.stringify({
                })
            );
          }
        });
    };

    MythicProgBar.ProgressCancel = function() {
        $(".progress-container").css({"display":"block"});
        $("#progress-label").text("PERUUTETTU");
        $("#progress-bar").stop().css( {"width": "100%", "background-color": "#C8000099"});

        setTimeout(function () {
            $(".progress-container").css({"display":"none"});
            $("#progress-bar").css("width", 0);
            $.post('http://el1te_progbar/actionCancel', JSON.stringify({
                })
            );
        }, 1000);
    };

    MythicProgBar.CloseUI = function() {
        $('.main-container').css({"display":"none"});
        $(".character-box").removeClass('active-char');
        $(".character-box").attr("data-ischar", "false")
        $("#delete").css({"display":"none"});
    };
    
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case 'el1te_progress':
                MythicProgBar.Progress(event.data);
                break;
            case 'el1te_progress_cancel':
                MythicProgBar.ProgressCancel();
                break;
        }
    })
});