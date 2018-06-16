/**
 * Created by yonad on 17/06/2018.
 */

// needs babel + jsx to run

const lipstick = function(color){
    return function (target) {
        target.lips = color
    }
};

const earrings = function (target) {
    target.hasEarrings = 'yes';
};

const readonly = function (target, key, descriptor) {
    descriptor.writable = false;
    return descriptor;
};

@lipstick('black')
@earrings
class Girl {
    constructor(color){
        this.color = color;
    }
    @readonly
    getColor(){
        return this.color;
    }
}

const noa = Girl('white');

console.log(noa.getColor());

console.log(`her lips are ${Girl.lips} but does she has earrings? ${Girl.hasEarrings}`);

