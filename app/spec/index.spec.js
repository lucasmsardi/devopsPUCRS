const { hello } = require('../index');

test('hello function retorna "Hello World!"', () => {
  expect(hello()).toBe("Hello World!");
});
