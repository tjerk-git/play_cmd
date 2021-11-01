import {Controller} from "@hotwired/stimulus";
import {enter, leave} from 'el-transition';

export default class extends Controller {
    static targets = ["showModal", "button"];
    connect() {
        this.element[this.identifier] = this
        enter(this.showModalTarget)
    }

    close() {
        leave(this.showModalTarget)
        this.element.remove()
        this.modalTurboFrame.src = null
    }

    closeModal() {
        this.close()
    }

    escClose(event) {
        if (event.key === 'Escape') this.close();
    }

    get modalTurboFrame() {
        return document.querySelector("turbo-frame[id='modal']")
    }
}