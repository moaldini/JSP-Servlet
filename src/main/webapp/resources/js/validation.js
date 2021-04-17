$(document).ready(function () {
    // LOGIN
    $(document).on('click', '.login-btn', function (e) {
        e.preventDefault();
        let thisBtn = $(this),
            thisForm = thisBtn.parents('form'),
            formUrl = thisForm.attr('action'),
            formMethod = thisForm.attr('method'),
            valid = validateForm(thisForm);

        if(valid){
            let formID = thisForm.attr('id'),
                formData = new FormData($('#'+ formID)[0]);
            $.ajax({
                type: formMethod,
                url: formUrl,
                data: {"userName":$('input[name=userName]').val(),"password":$('input[name=password]').val(),"remember":$('input[name=remember]').val()},
                success: function (response) {
                    //alert(response);
                    if(response == 'True'){
                        $('.section-alert').empty();
                        thisForm.find('.section-alert').removeClass('alert-danger');
                        thisForm.find('.section-alert').addClass('alert alert-success').text("Welcome....");
                        setTimeout(() => {
                            window.location.href = '/shopping';
                        }, 2000);
                    }else{
                        $('.section-alert').empty();
                        thisForm.find('.section-alert').addClass('alert alert-danger').text(response);
                    }
                }
            });
        }
    });
    // SIGN UP
    $(document).on('click', '.reg-btn', function (e) {
        e.preventDefault();
        let thisBtn = $(this),
            thisForm = thisBtn.parents('form'),
            formUrl = thisForm.attr('action'),
            formMethod = thisForm.attr('method'),
            valid = validateForm(thisForm);

        if(valid){
            let formID = thisForm.attr('id'),
                formData = new FormData($('#'+ formID)[0]);
            $.ajax({
                type: formMethod,
                url: formUrl,
                data: {"fullName":$('input[name=fullName]').val(),"userName":$('input[name=userName]').val(),"email":$('input[name=email]').val(),"password":$('input[name=password]').val()},
                success: function (response) {
                    //alert(response);
                    if(response == 'True'){
                        $('.section-alert').empty();
                        thisForm.find('.section-alert').removeClass('alert-danger');
                        thisForm.find('.section-alert').addClass('alert alert-success').text("Welcome....");
                        setTimeout(() => {
                            window.location.href = '/shopping';
                        }, 2000);
                    }else{
                        $('.section-alert').empty();
                        thisForm.find('.section-alert').addClass('alert alert-danger').text(response);
                    }
                }
            });
        }
    });
});
function validateForm(selector) {
    let errors = [],
        inputVal = '',
        inputName = '',
        inputs = $(selector).find('.required');
    $.each(inputs, function(index, ele){
        inputVal = $(this).val();
        inputName = $(this).attr('name');
        if(inputVal === '' || inputVal.trim().length === 0){
            errors.push(inputName);
            $(this).addClass('has-error');
            //$(this).parents('div').addClass('has-error');
        }
    });
    if(errors.length > 0){
        return false;
    }
    return true;
}