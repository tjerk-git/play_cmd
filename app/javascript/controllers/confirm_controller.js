import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.element.addEventListener('submit', this.confirm.bind(this))
    }

    confirm(event) {
        event.stopPropagation()
        event.preventDefault()
        this.turboFrame.innerHTML = this.modalHTML
    }

    get modalHTML() {
        return `
        <div class="fixed z-50 inset-0 overflow-y-auto" data-controller="modal" data-action="keyup@document->modal#escClose" aria-labelledby="modal-title" role="dialog" aria-modal="true">
            <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">

              <div
                data-modal-target="showModal"
                data-transition-enter="ease-out duration-300"
                data-transition-enter-start="opacity-0"
                data-transition-enter-end="opacity-100"
                data-transition-leave="ease-in duration-200"
                data-transition-leave-start="opacity-100"
                data-transition-leave-end="opacity-0"
                class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
                aria-hidden="true"></div>

              <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

              <div
                data-modal-target="showModal"
                data-transition-enter="ease-out duration-300"
                data-transition-enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                data-transition-enter-end="opacity-100 translate-y-0 sm:scale-100"
                data-transition-leave="ease-in duration-200"
                data-transition-leave-start="opacity-100 translate-y-0 sm:scale-100"
                data-transition-leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                class="inline-block align-bottom bg-white rounded-lg px-4 pt-5 pb-4 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-sm sm:w-full sm:p-6">
                <div>
                  <div class="sm:flex sm:items-start">
                    <div class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
                      <svg class="h-6 w-6 text-red-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                      </svg>
                    </div>
                    <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                      <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">
                        ${this.message}
                      </h3>
                      <div class="mt-2">
                        <p class="text-sm text-gray-500">
                          Are you sure you want to delete this item? Once done, you cannot undo it.
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="mt-5 sm:mt-4 sm:flex sm:flex-row-reverse">
                    ${this.formHTML}
                    <button type="button" data-action="modal#close" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:w-auto sm:text-sm">
                      Cancel
                    </button>
                </div>
              </div>
            </div>
        </div>
        `
    }

    get formHTML() {
        let element = document.createRange().createContextualFragment(this.element.outerHTML)
        let form    = element.querySelector('form')
        let button  = element.querySelector('input[type="submit"], button[type="submit"]')

        form.removeAttribute('data-controller')
        form.dataset.turboFrame = "_top"
        form.dataset.action     = "turbo:submit-end->modal#close"

        button.className                = "inline-flex justify-center w-full px-4 py-2 text-base font-medium text-white bg-red-600 border border-transparent rounded-md shadow-sm hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
        button.dataset.shortcutsTarget  = "confirm"
        button.innerText                = "Delete"
        button.value                    = "Delete"

        let div = document.createElement('div')
        div.appendChild(form)

        return div.innerHTML
    }

    get message() {
        return this.element.dataset.confirmMessage
    }

    get turboFrame() {
        return document.querySelector('turbo-frame[id="modal"]')
    }
}