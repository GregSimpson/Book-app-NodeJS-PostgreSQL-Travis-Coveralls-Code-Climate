

## the book_store api
books_url="http://localhost:8000"
books_endpoint="/api/v1/books"

echo call APIs on ${books_url}/${books_endpoint}

## AUDIT Section ##
function getAudit() {
  echo GET 100 audit data rows...
  curl -X GET -H "Content-Type: application/json" ${nodered_url}/fom/v1/audit
}

function delAudit() {
  echo DELETE audit data ...
  curl -X DELETE -H "Content-Type: application/json" ${nodered_url}/fom/v1/nodered-script-user/audit
}

## BOOKS Section ##
function getBookList() {
  echo GET ALL book data ...
  curl -X GET -H "Content-Type: application/json" ${books_url}${books_endpoint}|node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
}

function getBookById() {
  echo GET Book data ...
  curl -X GET -H "Content-Type: application/json" ${books_url}${books_endpoint}/1|node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
}

function postNewBook() {
  echo POST Book data ...
  curl -X POST -H "Content-Type: application/json" --data @/home/hipops-dev/git_stuff/Book-app-NodeJS-PostgreSQL-Travis-Coveralls-Code-Climate/bash/post-book-data.json ${books_url}${books_endpoint}
}

function delBook() {
  echo DELETE Book data ...
  curl -X DELETE -H "Content-Type: application/json" ${books_url}${books_endpoint}/3
}

function putBook() {
  echo PUT Book data ...
  curl -X PUT -H "Content-Type: application/json" --data @/home/hipops-dev/git_stuff/Book-app-NodeJS-PostgreSQL-Travis-Coveralls-Code-Climate/bash/put-book-data.json ${books_url}${books_endpoint}/1
}



# # #
function all_book_calls() {
  postNewBook
  #getBookList
  putBook
  #getBookById
  #delBook
  getBookList
}


###############################################
#### Main - run these function collections ####
###############################################
all_book_calls

