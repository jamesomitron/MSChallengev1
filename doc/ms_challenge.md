# Challenge

> Version 1.0

## Path Table

| Method | Path | Description |
| --- | --- | --- |
| GET | [/books/{id}](#getbooksid) | Get Book Info by Book ID |
| PUT | [/books/{id}](#putbooksid) | Update Book Info by Book ID |
| DELETE | [/books/{id}](#deletebooksid) | Delete Book Info by Book ID |
| GET | [/books](#getbooks) | Get Book Info all Books |
| POST | [/books](#postbooks) | Create New Book |
| GET | [/books/borrowed](#getbooksborrowed) | Get borrowed Books |
| GET | [/borrowed/{id}](#getborrowedid) | Get Books borrowed by Id |
| PUT | [/borrowed/{id}](#putborrowedid) | Update Books borrowed by Id |
| DELETE | [/borrowed/{id}](#deleteborrowedid) | Delete Books borrowed by Id |
| GET | [/borrowed/](#getborrowed) | Get Books borrowed |
| POST | [/borrowed/](#postborrowed) | Borrow Books |
| GET | [/returned/{id}](#getreturnedid) | Get Books Returned by id |
| PUT | [/returned/{id}](#putreturnedid) | Update Books Returned by id |
| DELETE | [/returned/{id}](#deletereturnedid) | Delete Books Returned by id |
| GET | [/returned](#getreturned) | Get Books returned |
| POST | [/returned](#postreturned) | Return books |

## Reference Table

| Name | Path | Description |
| --- | --- | --- |
| Book | [#/components/schemas/Book](#componentsschemasbook) |  |
| LibaryRequest | [#/components/schemas/LibaryRequest](#componentsschemaslibaryrequest) |  |
| Entry | [#/components/schemas/Entry](#componentsschemasentry) |  |

## Path Details

***

### [GET]/books/{id}

- Summary  
Get Book Info by Book ID

- Description  
Retrieve the information of the book with the matching book ID.

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  title?: string
  edition?: string
  author?: string
  publisher?: string
  cost?: integer
  remarks?: string
}
```

***

### [PUT]/books/{id}

- Summary  
Update Book Info by Book ID

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  title?: string
  edition?: string
  author?: string
  publisher?: string
  cost?: integer
  remarks?: string
}
```

***

### [DELETE]/books/{id}

- Summary  
Delete Book Info by Book ID

#### Responses

- 200 OK

***

### [GET]/books

- Summary  
Get Book Info all Books

- Description  
Retrieve the information of the book with the matching book ID.

#### Parameters(Query)

```ts
author?: string
```

```ts
publisher?: string
```

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  title?: string
  edition?: string
  author?: string
  publisher?: string
  cost?: integer
  remarks?: string
}[]
```

- Examples

***

### [POST]/books

- Summary  
Create New Book

#### RequestBody

- application/json

```ts
{
  id?: integer
  title?: string
  edition?: string
  author?: string
  publisher?: string
  cost?: integer
  remarks?: string
}
```

#### Responses

- 200 OK

***

### [GET]/books/borrowed

- Summary  
Get borrowed Books

#### Parameters(Query)

```ts
dateFrom?: string
```

```ts
dateTo?: string
```

```ts
user?: string
```

```ts
issuer?: string
```

```ts
bookId?: string
```

```ts
duration?: number
```

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}
```

***

### [GET]/borrowed/{id}

- Summary  
Get Books borrowed by Id

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}
```

***

### [PUT]/borrowed/{id}

- Summary  
Update Books borrowed by Id

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}
```

***

### [DELETE]/borrowed/{id}

- Summary  
Delete Books borrowed by Id

#### Responses

- 200 OK

***

### [GET]/borrowed/

- Summary  
Get Books borrowed

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}[]
```

***

### [POST]/borrowed/

- Summary  
Borrow Books

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}[]
```

***

### [GET]/returned/{id}

- Summary  
Get Books Returned by id

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}
```

***

### [PUT]/returned/{id}

- Summary  
Update Books Returned by id

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}
```

***

### [DELETE]/returned/{id}

- Summary  
Delete Books Returned by id

#### Responses

- 200 OK

***

### [GET]/returned

- Summary  
Get Books returned

#### Responses

- 200 OK

`application/json`

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}[]
```

***

### [POST]/returned

- Summary  
Return books

#### Responses

- 200 OK

`application/json`

```ts
{
  bookId?: integer
  borrowedBy?: integer
  returnDate?: string
}[]
```

## References

### #/components/schemas/Book

```ts
{
  id?: integer
  title?: string
  edition?: string
  author?: string
  publisher?: string
  cost?: integer
  remarks?: string
}
```

### #/components/schemas/LibaryRequest

```ts
{
  bookId?: integer
  borrowedBy?: integer
  returnDate?: string
}
```

### #/components/schemas/Entry

```ts
{
  id?: integer
  bookId?: integer
  issuer?: integer
  borrowedBy?: integer
  createdOn?: string
  returnDate?: string
  status?: string
  returnedOn?: string
}
```