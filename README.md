# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# ER図

```mermaid
erDiagram
    USERS {
        string email NOT NULL UNIQUE
        string encrypted_password NOT NULL
        string name NOT NULL
        text profile NOT NULL
        text occupation NOT NULL
        text position NOT NULL
    }

    PROTOTYPES {
        string title NOT NULL
        text catch_copy NOT NULL
        text concept NOT NULL
        references user_id NOT NULL
    }

    COMMENTS {
        text content NOT NULL
        references prototype_id NOT NULL
        references user_id NOT NULL
    }

    USERS ||--o{ PROTOTYPES : "has many"
    USERS ||--o{ COMMENTS : "has many"
    PROTOTYPES ||--o{ COMMENTS : "has many"
