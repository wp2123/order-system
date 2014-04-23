function fetch_customer_info(el) {
    var new_customer_info_objs = $(el).parents('.modal-content').find('.new_customer_info');
    return {
        username: $(new_customer_info_objs[0]).val(),
        name: $(new_customer_info_objs[1]).val(),
        phone: $(new_customer_info_objs[2]).val(),
        email: $(new_customer_info_objs[3]).val(),
        password: $(new_customer_info_objs[4]).val()
    }
}
function new_customer(el) {
    var user_id = $(el).attr('current_user_id');
    var new_customer_info = fetch_customer_info(el);
    $.ajax({
        url: '/user/customer',
        type: 'POST',
        data: {user_id: user_id, customer_info: new_customer_info},
        success: function (data) {
            window.location.reload();
        },
        error: function (err) {
            console.log(err);
        }
    });
}