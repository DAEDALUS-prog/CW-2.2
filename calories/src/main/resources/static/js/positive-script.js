function openModal() {
    $.get("/positive", function(data) {
        $("#modalContainer").html(data); // добавление html-кода модального окна в контейнер на странице
        $("#myModal").modal("show"); // открытие модального окна
    });
}

openModal();