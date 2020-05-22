
let disks = [{pos: 1, size: 1},{pos: 1, size: 2},{pos: 1, size: 3}];

for(let i = 0; i < disks.length; i++){

let FuturePosition = 0;
let NextPositionDisks = [];

if(i < disks.length){
    FuturePosition = disks[i].pos + 1;
}else{
    FuturePosition = 1;
};

for(let j =  0; j < disks.length; j++){

    if(j != i && disks[j].pos == FuturePosition){
        NextPositionDisks.push(disks[j]);
    };

};

let AlreadyMoved = false;
for(let j = 0; j < disks.length; j++){

    if(disks[i].size > NextPositionDisks[j].size && !AlreadyMoved){
        disks[i].pos = FuturePosition;
        AlreadyMoved = true;
    }

};

console.log(disks[0]);
console.log(disks[1]);
console.log(disks[2]);

};

