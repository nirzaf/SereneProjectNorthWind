﻿namespace SereneTemplate.Administration {
    export interface TranslationUpdateRequest extends Serenity.ServiceRequest {
        TargetLanguageID?: string;
        Translations?: { [key: string]: string };
    }
}

