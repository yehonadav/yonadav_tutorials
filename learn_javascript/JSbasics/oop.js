const s = 'hello'.toLocaleUpperCase();
console.log(typeof s);

const s2 = new String('hello');
console.log(typeof s2);

// console.log(window);

// Object Literal
const book1 = {
    title:'poo',
    author:'bear',
    year:'2018',
    getSum: function() {return `${this.title} was written by ${this.author} in ${this.year}`}
};
console.log(Object.values(book1));
console.log(Object.keys(book1));
console.log(book1.getSum());


function Book(title, author, year) {
    this.title = title;
    this.author = author;
    this.year = year;
    // this.getSummary = function () {return `${this.title} was written by ${this.author} in ${this.year}`};
}

Book.prototype.getSummary = function () {return `${this.title} was written by ${this.author} in ${this.year}`};

Book.prototype.getBookAge = function () {
    const years = new Date().getFullYear() - this.year;
    return `${this.title} is ${years} years old`;
};

Book.prototype.revise = function (newYear) {
    this.year = newYear;
    this.revised = true;
};

const book2 = new Book('pool', 'Don Von', 1996);
const book3 = new Book('pool2', 'Don Von', 2001);

console.log(book2.year);
book2.revise(1995);
console.log(book3.getSummary());
console.log(book3.getBookAge());
console.log(book2);