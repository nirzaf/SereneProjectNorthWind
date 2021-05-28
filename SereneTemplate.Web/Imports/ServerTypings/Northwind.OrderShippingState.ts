namespace SereneTemplate.Northwind {
    export enum OrderShippingState {
        NotShipped = 0,
        Shipped = 1
    }
    Serenity.Decorators.registerEnumType(OrderShippingState, 'SereneTemplate.Northwind.OrderShippingState', 'Northwind.OrderShippingState');
}
