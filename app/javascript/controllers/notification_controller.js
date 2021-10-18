import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["buttons", "countdown"];

    connect() {
        const timeout = parseInt(3);

        if (!this.isPreview) {
            setTimeout(() => {
                this.element.classList.remove("hidden");
                this.element.classList.add(
                    "transform",
                    "ease-out",
                    "duration-300",
                    "transition",
                    "translate-y-2",
                    "opacity-0",
                    "sm:tranlate-y-0",
                    "sm:translate-x-2"
                );
                setTimeout(() => {
                    this.element.classList.add(
                        "translate-y-0",
                        "opacity-100",
                        "sm:translate-x-0"
                    );
                }, 100);

                if (this.hasCountdownTarget) {
                    this.countdownTarget.style.animation = "notification-countdown linear " + timeout + "s";
                }
            }, 500);
            this.timeoutId = setTimeout(() => {
                this.close();
            }, timeout * 1000 + 500);
        }
    }

    run(e) {
        e.preventDefault();
        this.stop();
        let _this = this;

        this.buttonsTarget.innerHTML = '<span class="text-sm leading-5 font-medium text-gray-700">Processing...</span>'

        fetch(this.data.get("action_url"), {
            method: this.data.get("action-method").toUpperCase(),
            dataType: "script",
            credentials: "include",
            headers: {
                "X-CSRF-Token": this.csrfToken,
            },
        }).then(function (response) {
            let content;

            if (response.status === 200) {
                content = '<span class="text-sm leading-5 font-medium text-green-700">Done!</span>'
            } else {
                content = '<span class="text-sm leading-5 font-medium text-red-700">Error!</span>'
            }

            _this.buttonsTarget.innerHTML = content;

            setTimeout(() => {
                _this.close();
            }, 1000);
        });
    }

    stop() {
        clearTimeout(this.timeoutId);
        this.timeoutId = null;
    }

    close() {
        this.element.classList.remove(
            "transform",
            "ease-out",
            "duration-300",
            "translate-y-2",
            "opacity-100",
            "sm:translate-y-0",
            "sm:translate-x-2",
            "translate-y-0",
            "sm:translate-x-0"
        );

        this.element.classList.add("ease-in", "duration-100");

        setTimeout(() => {
            this.element.classList.add("opacity-0");
            this.element.classList.add("hidden");
        }, 100);

        setTimeout(() => {
            this.element.remove();
        }, 300);
    }

    get isPreview() {
        return document.documentElement.hasAttribute("data-turbolinks-preview");
    }

    get csrfToken() {
        const element = document.head.querySelector('meta[name="csrf-token"]');
        return element.getAttribute("content");
    }
}
