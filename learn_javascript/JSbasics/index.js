// dont use var
let name = 'bob';
console.log(name);

// bad practice
let firstName = 'Bi', lastName;

const interestRate = 0.3;
// interestRate = 1; this results in an error
console.log(interestRate);

// primitive/value types
// String Number Boolean undefined null
let a = 'bob'; // String Literal
let b = 30; // Number Literal
let c = true; // Boolean Literal
let d; // undefined --> you can also `let d = undefined` but its no practiced
let e = null; // for empty results or cleared variable


let person = {
    name: "mosh",
    age: 16
};

person.name = 'jonny';
console.log(person.name);
person['name'] = 'zoya';
console.log(person.name);

let colors = ['red', 'blue'];
console.log(colors[0]);
colors[2] = 'green';
console.log(colors.length);

function greet() {
    console.log('greetings!')
}

greet();

function greetName(name) {
    console.log('greetings '+name+'!')
}

greetName(person.name);

function square(number) {
    return number ** 2;
}

console.log(square(2));

const companies = [
    {name:"google", category:"software", start:1981 , end:2003},
    {name:"ebay", category:"web", start:1992 , end:2008},
    {name:"amazon", category:"web", start:1999 , end:2007},
    {name:"wix", category:"web", start:1989 , end:2010},
    {name:"apple", category:"software", start:2009 , end:2014},
    {name:"ibm", category:"software", start:1987 , end:2010},
    {name:"amdocs", category:"communication", start:1986 , end:1996},
    {name:"att", category:"communication", start:2011 , end:2016},
    {name:"microsoft", category:"software", start:1981 , end:1989},
];

const ages = [33,12,20,16,5,54,21,44,61,13,15,45,25,64,32];

for (let i = 0; i < companies.length; i++) {
    console.log(companies[i]);
}

companies.forEach(function(company, index, companies) {
    console.log(company.name)
});

var canDrink = [];
for(let i = 0; i < ages.length; i++) {
    if(ages[i] >= 21) {
        canDrink.push(ages[i]);
    }
}

var canDrink = ages.filter(function (age) {
    if(age >= 21) {
        return true
    }
});

var canDrink = ages.filter(age => age >= 21);
console.log(canDrink);

const webCompanies = companies.filter(company => company.category === 'web');
console.log(webCompanies);

const eightiesCompanies = companies.filter(company => company.start < 1990 && company.start > 1979);
console.log(eightiesCompanies);

const lastedMT9YCompanies = companies.filter(company => company.end - company.start > 9);
console.log(lastedMT9YCompanies);


// map

const companyNames = companies.map(company => {return company.name});
console.log(companyNames);

const companyNamesAndYears = companies.map(company =>
    `${company.name} [${company.start} - ${company.end}]`
);
console.log(companyNamesAndYears);

const agesSquareRoot = ages.map(age => Math.sqrt(age));
console.log(agesSquareRoot);

const agesSqrtT2 = ages
    .map(age => Math.sqrt(age))
    .map(age => age * 2);
console.log(agesSqrtT2);

// sort

const sortedCompanies = companies.sort((a, b) => (a.start > b.start ? 1 : -1));
console.log(sortedCompanies);

const sortedAges = ages.sort((a, b) => a - b);
console.log(sortedAges);

const sortedAgesDecand = ages.sort((a, b) => b - a);
console.log(sortedAgesDecand);

// reduce

const ageSum = ages.reduce((total, age) => total + age);
console.log(ageSum);

// combined

const combo = ages
    .map(age => age * 2)
    .filter(age => age >= 40)
    .sort((a, b) => a - b)
    .reduce((total, n) => total + n);

console.log(combo);