﻿namespace SereneTemplate.Administration {

    @Serenity.Decorators.registerClass()
    export class LanguageDialog extends Serenity.EntityDialog<LanguageRow, any> {
        protected getFormKey() { return LanguageForm.formKey; }
        protected getIdProperty() { return LanguageRow.idProperty; }
        protected getLocalTextPrefix() { return LanguageRow.localTextPrefix; }
        protected getNameProperty() { return LanguageRow.nameProperty; }
        protected getService() { return LanguageService.baseUrl; }

        protected form = new LanguageForm(this.idPrefix);
    }
}