﻿namespace SereneTemplate.Administration {

    @Serenity.Decorators.registerClass()
    export class RolePermissionDialog extends Serenity.TemplatedDialog<RolePermissionDialogOptions> {

        private permissions: PermissionCheckEditor;

        constructor(opt: RolePermissionDialogOptions) {
            super(opt);

            this.permissions = new PermissionCheckEditor(this.byId('Permissions'), {
                showRevoke: false
            });

            RolePermissionService.List({
                RoleID: this.options.roleID,
                Module: null,
                Submodule: null
            }, response => {
                this.permissions.value = response.Entities.map(x => (<UserPermissionRow>{ PermissionKey: x }));
            });

            this.permissions.implicitPermissions = Q.getRemoteData('Administration.ImplicitPermissions');
        }

        protected getDialogOptions(): JQueryUI.DialogOptions {
            let opt = super.getDialogOptions();

            opt.buttons = [
                {
                    text: Q.text('Dialogs.OkButton'),
                    click: e => {
                        RolePermissionService.Update({
                            RoleID: this.options.roleID,
                            Permissions: this.permissions.value.map(x => x.PermissionKey),
                            Module: null,
                            Submodule: null
                        }, response => {
                            this.dialogClose();
                            window.setTimeout(() => Q.notifySuccess(Q.text('Site.RolePermissionDialog.SaveSuccess')), 0);
                        });
                    }
                }, {
                    text: Q.text('Dialogs.CancelButton'),
                    click: () => this.dialogClose()
                }];

            opt.title = Q.format(Q.text('Site.RolePermissionDialog.DialogTitle'),
                this.options.title);

            return opt;
        }

        protected getTemplate(): string {
            return '<div id="~_Permissions"></div>';
        }
    }

    export interface RolePermissionDialogOptions {
        roleID?: number;
        title?: string;
    }
}