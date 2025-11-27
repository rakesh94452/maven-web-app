<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Rakesh.store - Food Market & Grocery</title>
  <style>
    body {
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background: #f7fbf4;
      margin: 0;
      padding: 0;
    }

    header {
      background: linear-gradient(135deg, #4caf50, #8bc34a);
      color: white;
      padding: 40px 20px;
      text-align: center;
      border-bottom-left-radius: 50px;
      border-bottom-right-radius: 50px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    }

    header h1 {
      margin: 0;
      font-size: 2.5rem;
    }

    header p {
      margin-top: 10px;
      font-size: 1.1rem;
      opacity: 0.95;
    }

    .container {
      max-width: 1100px;
      margin: 50px auto;
      padding: 0 20px;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 25px;
    }

    .product-card {
      background: #fff;
      padding: 25px;
      border-radius: 20px;
      box-shadow: 0 8px 18px rgba(0,0,0,0.08);
      transition: all 0.3s ease;
      text-align: center;
    }

    .product-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 24px rgba(0,0,0,0.15);
    }

    .product-icon {
      width: 70px;
      height: 70px;
      margin: 0 auto 15px;
      border-radius: 50%;
      background: linear-gradient(135deg, #4caf50, #66bb6a);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 32px;
      color: white;
    }

    .product-title {
      font-size: 1.4rem;
      font-weight: bold;
      color: #2e7d32;
      margin-bottom: 10px;
    }

    .product-desc {
      font-size: 1rem;
      color: #555;
      margin-bottom: 20px;
      line-height: 1.5;
    }

    .btn {
      display: inline-block;
      text-decoration: none;
      background: linear-gradient(135deg, #4caf50, #388e3c);
      color: white;
      padding: 10px 22px;
      border-radius: 30px;
      font-size: 0.95rem;
      transition: 0.3s;
      font-weight: 500;
    }

    .btn:hover {
      background: linear-gradient(135deg, #2e7d32, #1b5e20);
      transform: scale(1.07);
    }
  </style>

  <script src="https://kit.fontawesome.com/2b5d5a9c8f.js" crossorigin="anonymous"></script>
</head>
<body>

  <header>
    <h1>🛒 RAKESH.STORE</h1>
    <p>Fresh Food Market & Grocery Store - Quality You Can Trust</p>
  </header>

  <div class="container">

    <div class="product-card">
      <div class="product-icon"><i class="fas fa-apple-alt"></i></div>
      <div class="product-title">Fresh Fruits</div>
      <div class="product-desc">
        Handpicked seasonal fruits delivered fresh from farms to your doorstep.
      </div>
      <a href="#" class="btn">Shop Now</a>
    </div>

    <div class="product-card">
      <div class="product-icon"><i class="fas fa-carrot"></i></div>
      <div class="product-title">Organic Vegetables</div>
      <div class="product-desc">
        Healthy and chemical-free vegetables for your daily family needs.
      </div>
      <a href="#" class="btn">Order Now</a>
    </div>

    <div class="product-card">
      <div class="product-icon"><i class="fas fa-bread-slice"></i></div>
      <div class="product-title">Daily Essentials</div>
      <div class="product-desc">
        Rice, pulses, spices, oil and all grocery items at best prices.
      </div>
      <a href="#" class="btn">View Products</a>
    </div>

    <div class="product-card">
      <div class="product-icon"><i class="fas fa-shopping-basket"></i></div>
      <div class="product-title">Special Discounts</div>
      <div class="product-desc">
        Amazing offers and festival discounts on grocery bundles.
      </div>
      <a href="#" class="btn">Check Offers</a>
    </div>

  </div>

</body>
</html>
