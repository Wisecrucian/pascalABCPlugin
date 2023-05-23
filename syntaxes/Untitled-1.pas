unit CoffeeMachineUnit;

type
  Coffee = class
    name_coffee: string;
    water, milk, coffee_bean, disposable_cups, price: integer;
    
    constructor(name: string; water, milk, coffee_bean, disposable_cups, price: integer);
  end;

constructor Coffee.Create(name: string; water, milk, coffee_bean, disposable_cups, price: integer);
begin
  name_coffee := name;
  self.water := water;
  self.milk := milk;
  self.coffee_bean := coffee_bean;
  self.disposable_cups := disposable_cups;
  self.price := price;
end;

type
  CoffeeMachine = class
    waterM, milkM, coffee_beanM, disposable_cupsM, moneyM: integer;
    coffee_types: array of Coffee;
    constructor(water, milk, coffee_bean, disposable_cups, money: integer);
    begin
      waterM := water;
      milkM := milk;
      coffee_beanM := coffee_bean;
      disposable_cupsM := disposable_cups;
      moneyM := money;
      CoffeeArray();
    end;
    
    procedure CoffeeArray();
    begin
      coffee_types := arr(
        new coffee('Эспрессо', 250, 0, 16, 1, 70),
        new coffee('Латте', 350, 75, 20, 1, 110),
        new coffee('Капучино', 200, 100, 12, 1, 85));
    end;
    
    function check_ingridients(c: coffee): boolean;
    begin
      result := ((waterM >= c.water) and (milkM >= c.milk) and (coffee_beanM >= c.coffee_bean) and (disposable_cupsM >= c.disposable_cups));
    end;
    
    procedure condition_coffeeM(c: coffee);
    begin
      if check_ingridients(c) then
      begin
        writeln('Ваш кофе готов!');
        moneyM -= c.price;
      end
      else
        writeln('По техническим причинам кофе не может быть приготовлен');
    end;
    
    procedure add_ingridients(waterS, milkS, coffee_beanS, disposable_cupsS: integer);
    begin
      assert(waterS > 0, 'неверный ввод');
      assert(milkS > 0, 'неверный ввод');
      assert(coffee_beanS > 0, 'неверный ввод');
      assert(disposable_cupsS > 0, 'неверный ввод');
      waterM += waterS;
      coffee_beanM += coffee_beanS;
      milkM += milkS;
      disposable_cupsM += disposable_cupsS;
    
    end;
    
    function CountMoney: integer;
    begin
      result := moneyM;
      moneyM := 0;
    end;
  end;

end.