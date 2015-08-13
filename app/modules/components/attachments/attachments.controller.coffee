class AttachmentsController
    @.$inject = [
        "tgAttachmentsService"
    ]

    attachments: Immutable.List()

    constructor: (@attachmentsService) ->
        @.maxFileSize = @attachmentsService.maxFileSize
        @.maxFileSizeFormated = @attachmentsService.maxFileSizeFormated

    addAttachment: (file) ->
        attachment = Immutable.fromJS({
            file: file,
            name: file.name,
            size: file.size
        })

        if @attachmentsService.validate(file)
            @.attachments = @.attachments.push(attachment)
            @.onAdd({file: file})

    addAttachments: (files) ->
        _.forEach files, @.addAttachment.bind(this)

    deleteAttachment: (toDeleteAttachment) ->
        @.attachments = @.attachments.filter (attachment) -> attachment != toDeleteAttachment

angular.module("taigaComponents").controller("Attachments", AttachmentsController)
