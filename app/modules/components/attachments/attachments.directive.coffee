AttachmentsDirective = () ->
    link = (scope, el, attrs, ctrl) ->

    return {
        scope: {
            onAdd: "&"
        },
        bindToController: true,
        controller: "Attachments",
        controllerAs: "vm",
        templateUrl: "components/attachments/attachments.html",
        link: link
    }

AttachmentsDirective.$inject = []

angular.module("taigaComponents").directive("tgAttachmentz", AttachmentsDirective)
