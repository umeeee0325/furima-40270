window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = parseInt(priceInput.value);
     const addTaxDom = document.getElementById("add-tax-price");
     const profitDom = document.getElementById("profit");

     addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toString();
     profitDom.innerHTML = (inputValue - parseInt(addTaxDom.innerHTML)).toString();
  })
});

