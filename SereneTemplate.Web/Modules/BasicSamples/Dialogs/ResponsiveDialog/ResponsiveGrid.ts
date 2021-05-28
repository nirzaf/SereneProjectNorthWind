/// <reference path="../../../Northwind/Order/OrderGrid.ts" />

namespace SereneTemplate.BasicSamples {

    /**
     * Subclass of OrderGrid to override dialog type to ResponsiveDialog
     */
    @Serenity.Decorators.registerClass()
    export class ResponsiveGrid extends Northwind.OrderGrid {

        protected getDialogType() { return ResponsiveDialog; }

        constructor(container: JQuery) {
            super(container);
        }
    }
}