class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.

    const date = new Date;
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this._tick();
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let h = `${this.hours}`;
    console.log(this);
    let m = `${this.minutes}`;
    let s = `${this.seconds}`;

    if (this.hours < 10) {
      h = '0' + h;
    }
    if (this.minutes < 10) {
      m = '0' + m;
    }
    if (this.seconds < 10) {
      s = '0' + s;
    }
    console.log(`${h}:${m}:${s}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    const boundFunction = this.increment.bind(this);
    setInterval(boundFunction, 1000);
  }

  increment() {
    this.printTime();
    this.seconds++;
    if (this.seconds===60){
      this.minutes++;
      this.seconds = 0;
    }
    if (this.minutes === 60){
      this.minutes = 0;
      this.hours++;
    }
    if (this.hours === 24){
      this.hours = 0;
    }
  }
}

const clock = new Clock();
