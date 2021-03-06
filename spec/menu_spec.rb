require 'menu'

describe Menu do
  subject { Menu.new }

  let(:dishes) { [{ dish: :chicken, value: 7.50 },
    { dish: :beef, value: 9.00 },
    { dish: :pasta, value: 8.50 },
    { dish: :pizza, value: 12.00 },
    { dish: :burger, value: 7.00 }]
  }

  it 'starts with an array of dishes' do
    expect(subject.dishes).to eq(dishes)
  end

  it 'prints menu, line by line, when you call show_menu' do
    message = "Chicken £7.50\nBeef £9.00\nPasta £8.50\nPizza £12.00\nBurger £7.00\n"
    expect { subject.show_menu }.to output(message).to_stdout
  end

  it 'returns a dish if its on the menu' do
    expect(subject.return_dish(:beef)).to eq({ dish: :beef, value: 9.00 })
  end

  it 'raises an error if a dish isnt on the menu' do
    expect { subject.return_dish(:curry) }.to raise_error("curry not on menu")
  end

end
