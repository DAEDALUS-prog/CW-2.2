function clearCache() {
    if (window.performance) {
        if (performance.clearCache) {
        performance.clearCache();
        location.reload(true);
        }
    }
}
//Не учитывается кэш-браузера.
//При работе с backend удалять

clearCache();