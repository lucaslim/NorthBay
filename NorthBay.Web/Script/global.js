$(document).ready(function () {
    $('#cb_selectall').click(function () {
        $(this).closest('table').find('input[type=checkbox]').prop('checked', this.checked);
    });
});
