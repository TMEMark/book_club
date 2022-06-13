/**
 * Function getBook - retuns data array from db table books
 *
 * @return variable array with book data
 */
function getBook(){
    global $db;
    $query = ("SELECT * FROM books");
    $statement = $db->prepare($query);
    $statement->execute();
    $array = $statement->fetchAll();
    $statement->closeCursor();

    return $array;
}

function addBook($book_name, $book_author_id, $book_genre_id){
    global $db;
    $count = 0;
    $query = 
    "INSERT INTO books (book_name, book_author_id, book_genre_id) 
    VALUES (:book_name, :book_author_id, :book_genre_id)";
    $statement = $db->prepare($query);
    $statement->bindValue(':book_name',$book_name);
    $statement->bindValue(':book_author_id',$book_author_id);
    $statement->bindValue(':book_genre_id', $book_genre_id);
    if ($statement->execute()) {
        $count = $statement->rowCount();
    };
    $statement->closeCursor();

    return $count;
}

function updateBook($book_id, $book_name, $book_author_id, $book_genre_id){
    global $db;
    $count = 0;
    $query = ("UPDATE books SET 
    book_name = :book_name,
    book_author_id = :book_author_id,
    book_genre_id = :book_genre_id 
    WHERE book_id = :book_id ");
    $statement = $db->prepare($query);
    $statement->bindValue(':book_id',$book_id);
    $statement->bindValue(':book_name',$book_name);
    $statement->bindValue(':book_author_id',$book_author_id);
    $statement->bindValue(':book_genre_id', $book_genre_id);
    if ($statement->execute()) {
        $count = $statement->rowCount();
    };
    $statement->closeCursor();
    return $count;
}

function deleteBook($book_id){
    global $db;
    $count= 0;
    $query= "DELETE FROM books 
                WHERE book_id = :book_id";
                $statement = $db->prepare($query);
    $statement->bindValue(':book_id', $book_id);
    if ($statement->execute()) {
        $count = $statement->rowCount();
    };
    $statement->closeCursor();
    return $count;
}