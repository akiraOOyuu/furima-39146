// DOMの読み込みが完了した後に実行する関数
document.addEventListener('DOMContentLoaded', function() {
  // 計算する関数
  function calculate() {
    const priceInput = document.getElementById('item-price');
    const price = parseInt(priceInput.value) || 0;
    const tax = 0.1;
    const commission = Math.floor(price * tax);
    const profit = price - commission;
  
    document.getElementById('add-tax-price').textContent = commission;
    document.getElementById('profit').textContent = profit;
  }
 
  // 初回の計算
  calculate();

  // 入力フィールドの値が変更されたときにcalculate関数を呼び出すイベントリスナーを登録
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', calculate);
});
