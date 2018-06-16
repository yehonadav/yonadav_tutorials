// object of prototypes
const bookProtos = {
    getSummary: function () {
        return `${this.title} was written by ${this.author} in ${this.year}`
    },

    getBookAge: function () {
        const years = new Date().getFullYear() - this.year;
        return `${this.title} is ${years} years old`;
    },

    revise: function (newYear) {
        this.year = newYear;
        this.revised = true;
    }
};


const book1 = Object.create(bookProtos);
book1.title = 'book1';
book1.author = 'bob';
book1.year = 1715;

const book2 = Object.create(bookProtos, {
    title: {value: 'book2'},
    author: {value: 'bob'},
    year: {value: 1750}
});

console.log(book1);
console.log(book2);