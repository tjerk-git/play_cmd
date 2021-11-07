import { Controller } from "@hotwired/stimulus";
const test = [
    'blue',
    'green',
    'indigo',
    'pink'
]

export default class extends Controller {
    static targets = ["accentColor"]

    connect() {
        const item = test[Math.floor(Math.random() * test.length)]
        this.accentColorTarget = item
    }
}
