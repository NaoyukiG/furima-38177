function price_calc (){
  const product_price = document.getElementById('item-price');


  product_price.addEventListener('keyup', () => {
    const priceValue = product_price.value;
    const tax_price = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');

    if (!isNaN(priceValue)){
    const tax_priceValue = Math.floor(product_price.value * 0.1);
    const profitValue = Math.floor(product_price.value * 0.9);
    tax_price.innerHTML = `${tax_priceValue}`;
    profit.innerHTML = `${profitValue}`;
    };
  });
  
};

window.addEventListener('load', price_calc);
