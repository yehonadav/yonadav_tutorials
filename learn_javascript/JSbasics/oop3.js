// constructor
function Book(title, author, year) {
    this.title = title;
    this.author = author;
    this.year = year;
    // this.getSummary = function () {return `${this.title} was written by ${this.author} in ${this.year}`};
}

// prototypes
Book.prototype.getSummary = function () {
    return `${this.title} was written by ${this.author} in ${this.year}`
};

Book.prototype.getBookAge = function () {
    const years = new Date().getFullYear() - this.year;
    return `${this.title} is ${years} years old`;
};

Book.prototype.revise = function (newYear) {
    this.year = newYear;
    this.revised = true;
};

/////////////////
// inheritance //
/////////////////

// magazine constructor
function Magazine(title, author, year, month) {
    Book.call(this, title, author, year);
    this.month = month;
}

// magazine prototypes
Magazine.prototype = Object.create(Book.prototype);
Magazine.prototype.constructor = Magazine;

// init
const mag1 = new Magazine('magma BA', 'john doe', "2018", 'Jan');

console.log(mag1);
console.log(mag1.getSummary());