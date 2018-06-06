function getCalendar() {
    return {
        month: document.querySelectorAll('[data-calendar-area="month"]')[0],
        next: document.querySelectorAll('[data-calendar-toggle="next"]')[0],
        previous: document.querySelectorAll('[data-calendar-toggle="previous"]')[0],
        label: document.querySelectorAll('[data-calendar-label="month"]')[0],
        activeDates: null,
        date: new Date(),
        todaysDate: new Date(),
        afterNext: null,
        afterPrevious: null,
        init: function (t) {
            (this.options = t),
                this.date.setDate(1),
                this.createMonth(),
                this.createListeners();
        },
        createListeners: function () {
            var t = this;
            this.next.addEventListener("click", function () {
                t.clearCalendar();
                var e = t.date.getMonth() + 1;
                t.date.setMonth(e), t.createMonth();

                if (t.afterNext) { t.afterNext() };
            }),
                this.previous.addEventListener("click", function () {
                    t.clearCalendar();
                    var e = t.date.getMonth() - 1;
                    t.date.setMonth(e), t.createMonth();
                    if (t.afterPrevious) { t.afterPrevious() };
                });
        },
        createDay: function (t, e, a) {
            var n = document.createElement("div"),
                s = document.createElement("span");

            (s.innerHTML = t),
                (n.className = "vcal-date"),
                n.setAttribute("data-calendar-date", this.date),
                1 === t &&
                (n.style.marginLeft =
                    0 === e ? 6 * 14.28 + "%" : 14.28 * (e - 1) + "%"),
                this.options.disablePastDays &&
                    this.date.getTime() <= this.todaysDate.getTime() - 1
                    ? n.classList.add("vcal-date--disabled")
                    : (n.classList.add("vcal-date--active"),
                        n.setAttribute("data-calendar-status", "active")),
                this.date.toString() === this.todaysDate.toString(),
                n.appendChild(s),
                this.month.appendChild(n);
        },
        createMonth: function () {
            for (var t = this.date.getMonth(); this.date.getMonth() === t;)
                this.createDay(
                    this.date.getDate(),
                    this.date.getDay(),
                    this.date.getFullYear()
                ),
                    this.date.setDate(this.date.getDate() + 1);
            this.date.setDate(1),
                this.date.setMonth(this.date.getMonth() - 1),
                (this.label.innerHTML =
                    this.monthsAsString(this.date.getMonth()) +
                    " " +
                    this.date.getFullYear());
        },
        monthsAsString: function (t) {
            return [
                "Enero",
                "Febrero",
                "Marzo",
                "Abril",
                "Mayo",
                "Junio",
                "Julio",
                "Agosto",
                "Septiembre",
                "Octubre",
                "Noviembre",
                "Deciembre"
            ][t];
        },
        clearCalendar: function () {
            vanillaCalendar.month.innerHTML = "";
        },
        removeActiveClass: function () {
            for (var t = 0; t < this.activeDates.length; t++)
                this.activeDates[t].classList.remove("vcal-date--selected");
        }
    };
}
