$(document).ready(() => {
    $.ajax({
        type: "GET",
        url: "/data",
        success: (response) => {
            const books = JSON.parse(response);
            const tableBody = $('#booksTable tbody');
            books.forEach((book) => {
                const { title, author, year, language, description, publisher, isbn10, isbn13 } = book;
                const row = `<tr>
                                <td>${title}</td>
                                <td>${author}</td>
                                <td>${year}</td>
                                <td>${language}</td>
                                <td>${description}</td>
                                <td>${publisher}</td>
                                <td>${isbn10}</td>
                                <td>${isbn13}</td>
                            </tr>`;
                tableBody.append(row);
            });
        },
        error: () => {
            alert('Error fetching data');
        }
    });
});
