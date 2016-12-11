$(document).ready(function () {
    for (var i = 1; i < 152; i++) {
        $('#pokemon').append(function () {
            return '<img id="' + i + '"src="http://pokeapi.co/media/img/' + i + '.png">'
        });
    }
    $('img').click(function () {
        console.log('you clicked pokemon #' + this.id);
        apiCall = 'http://pokeapi.co/api/v1/pokemon/' + this.id + '/';
        $.get(apiCall, function (res) {
            $('#pokedex').html(function () {
                str = '<h1>' + res.name + '</h1>';
                str += '<img src="http://pokeapi.co/media/img/' + res.pkdx_id + '.png">';
                str += '<h4>Types</h4><ul>';
                for (var i = 0; i < res.types.length; i++) {
                    str += '<li>' + res.types[i].name + '</li>';
                }
                str += '</ul><h4>Height</h4>';
                str += '<p>' + res.height + '</p>';
                str += '</ul><h4>Weight</h4>';
                str += '<p>' + res.weight + '</p>';
                return str;
            })
        }, "json");
    })
});