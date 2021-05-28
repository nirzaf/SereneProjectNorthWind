﻿/// <reference path="../../../Northwind/Category/CategoryGrid.ts" />

namespace SereneTemplate.BasicSamples {

    /**
     * Subclass of CategoryGrid to override dialog type to GetInsertedRecordIdDialog
     */
    @Serenity.Decorators.registerClass()
    export class GetInsertedRecordIdGrid extends Northwind.CategoryGrid {

        protected getDialogType() { return GetInsertedRecordIdDialog; }

        constructor(container: JQuery) {
            super(container);
        }
    }
}