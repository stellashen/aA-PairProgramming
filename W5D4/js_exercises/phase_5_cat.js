function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function cute() {
  return `${this.owner} loves ${this.name}`;
};


Cat.prototype.meow = () => {
  return 'meow!!';
};
