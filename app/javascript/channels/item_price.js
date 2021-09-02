window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price")
    const addTax = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTax
     console.log(addTaxDom);

    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = (Math.floor(inputValue - addTax));
      console.log(profitNumber);
  })

});