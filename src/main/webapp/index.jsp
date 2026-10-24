<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Petal & Stem — Pastel E‑Commerce</title>

  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

  <style>
    :root {
      --bg: #fdf6f0;
      --bg-card: #ffffff;
      --primary: #4a3f5c;
      --primary-light: #63547a;
      --accent: #f4a2b2;
      --accent-light: #fce4e8;
      --accent-dark: #d9839a;
      --muted: #8e85a0;
      --muted-light: #b8afc9;
      --surface: #f5eef7;
      --success: #a8d8c8;
      --warning: #fde2b8;
      --radius: 20px;
      --radius-sm: 14px;
      --shadow: 0 8px 30px rgba(180, 150, 170, 0.10);
      --shadow-hover: 0 20px 50px rgba(180, 150, 170, 0.18);
      --transition: 0.25s cubic-bezier(0.4, 0, 0.2, 1);
      --container: 1240px;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      font-family: 'Inter', system-ui, -apple-system, sans-serif;
      background: var(--bg);
      color: var(--primary);
      line-height: 1.5;
      -webkit-font-smoothing: antialiased;
    }
    a { color: inherit; text-decoration: none; }
    img { display: block; max-width: 100%; }
    button { cursor: pointer; font-family: inherit; border: none; background: none; color: inherit; }
    input { font-family: inherit; }
    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 24px; }

    .btn {
      display: inline-flex; align-items: center; justify-content: center; gap: 8px;
      padding: 12px 28px; border-radius: 999px; font-weight: 600; font-size: 15px;
      transition: var(--transition); border: 2px solid transparent;
    }
    .btn-primary { background: var(--accent); color: #fff; border-color: var(--accent); }
    .btn-primary:hover {
      background: var(--accent-dark); border-color: var(--accent-dark);
      transform: translateY(-3px); box-shadow: 0 12px 28px rgba(244, 162, 178, 0.40);
    }
    .btn-ghost {
      background: rgba(255,255,255,0.20); color: #fff; border-color: rgba(255,255,255,0.35);
      backdrop-filter: blur(4px);
    }
    .btn-ghost:hover { background: rgba(255,255,255,0.35); border-color: rgba(255,255,255,0.60); transform: translateY(-3px); }

    /* Toast */
    .toast {
      position: fixed; bottom: 30px; left: 50%;
      transform: translateX(-50%) translateY(100px);
      background: var(--primary); color: #fff; padding: 14px 28px;
      border-radius: 999px; font-weight: 500; font-size: 14px;
      box-shadow: 0 12px 32px rgba(74,63,92,0.30); z-index: 1000;
      opacity: 0; transition: all 0.35s cubic-bezier(0.4,0,0.2,1);
      display: flex; align-items: center; gap: 10px; pointer-events: none;
    }
    .toast.show { opacity: 1; transform: translateX(-50%) translateY(0); }
    .toast i { color: var(--accent); }

    /* Header */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(253,246,240,0.82);
      backdrop-filter: blur(18px); -webkit-backdrop-filter: blur(18px);
      border-bottom: 1px solid rgba(244,162,178,0.15);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between;
      gap: 16px; padding: 12px 0; min-height: 68px;
    }
    .brand {
      display: flex; align-items: center; gap: 10px; font-weight: 800;
      font-size: 22px; letter-spacing: -0.5px; color: var(--primary); flex-shrink: 0;
    }
    .brand .accent { color: var(--accent); }
    .brand i { font-size: 26px; color: var(--accent); }

    nav.main-nav ul { display: flex; gap: 4px; list-style: none; align-items: center; }
    nav.main-nav li a {
      display: flex; align-items: center; gap: 6px; padding: 8px 16px;
      border-radius: 999px; font-weight: 500; font-size: 14px;
      color: var(--muted); transition: var(--transition);
    }
    nav.main-nav li a:hover, nav.main-nav li a.active {
      background: var(--accent-light); color: var(--primary);
    }
    nav.main-nav li a i { font-size: 14px; }

    .header-actions { display: flex; align-items: center; gap: 6px; flex-shrink: 0; }
    .header-actions .icon-btn {
      width: 42px; height: 42px; display: grid; place-items: center;
      border-radius: 50%; font-size: 18px; color: var(--muted);
      transition: var(--transition); position: relative;
    }
    .header-actions .icon-btn:hover { background: var(--accent-light); color: var(--accent-dark); }

    .icon-wrap { position: relative; }
    .badge-count {
      position: absolute; top: -2px; right: -2px;
      background: var(--accent); color: #fff; font-size: 11px; font-weight: 700;
      width: 20px; height: 20px; border-radius: 50%;
      display: grid; place-items: center; border: 2px solid #fff;
      transition: transform 0.2s;
    }

    .search-wrap {
      display: flex; align-items: center; background: var(--surface);
      border-radius: 999px; padding: 0 16px 0 18px;
      transition: var(--transition); border: 2px solid transparent; min-width: 220px;
    }
    .search-wrap:focus-within {
      border-color: var(--accent); background: #fff;
      box-shadow: 0 0 0 5px rgba(244,162,178,0.15);
    }
    .search-wrap input {
      border: 0; background: transparent; outline: none; width: 100%;
      padding: 10px 0; font-size: 14px; color: var(--primary);
    }
    .search-wrap input::placeholder { color: var(--muted-light); }
    .search-wrap button {
      padding: 8px 0 8px 10px; color: var(--muted);
      font-size: 15px; transition: var(--transition);
    }
    .search-wrap button:hover { color: var(--accent); }

    .mobile-toggle {
      display: none; width: 42px; height: 42px; border-radius: 50%;
      font-size: 20px; background: var(--surface); color: var(--primary);
      transition: var(--transition);
    }
    .mobile-toggle:hover { background: var(--accent-light); }

    #mobileMenu {
      display: none; background: #fff;
      border-top: 1px solid rgba(244,162,178,0.12); padding: 12px 0 20px;
    }
    #mobileMenu ul { list-style: none; display: flex; flex-direction: column; gap: 4px; }
    #mobileMenu ul li a {
      display: flex; align-items: center; gap: 12px;
      padding: 12px 16px; border-radius: var(--radius-sm);
      font-weight: 500; color: var(--primary); transition: var(--transition);
    }
    #mobileMenu ul li a:hover { background: var(--surface); }
    #mobileMenu ul li a i { width: 22px; color: var(--muted); }

    /* Hero */
    .hero {
      position: relative; display: flex; align-items: center;
      min-height: 500px; padding: 60px 0; border-radius: var(--radius);
      overflow: hidden; margin: 20px 24px 0;
      background: linear-gradient(135deg, #e8d9f0 0%, #fce4e8 40%, #d9e6f2 100%);
      box-shadow: var(--shadow);
    }
    .hero::before {
      content: ''; position: absolute; inset: 0;
      background: url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover no-repeat;
      opacity: 0.10; z-index: 0;
    }
    .hero .container { position: relative; z-index: 1; }
    .hero .badge {
      display: inline-block; background: rgba(255,255,255,0.60);
      backdrop-filter: blur(6px); color: var(--primary);
      padding: 6px 18px; border-radius: 999px; font-weight: 600;
      font-size: 13px; letter-spacing: 0.3px; margin-bottom: 16px;
      border: 1px solid rgba(255,255,255,0.8);
    }
    .hero .badge i { color: var(--accent); margin-right: 6px; }
    .hero h1 {
      font-family: 'Playfair Display', serif; font-size: 52px; font-weight: 700;
      color: var(--primary); line-height: 1.15; max-width: 640px;
      margin-bottom: 16px; text-shadow: 0 2px 12px rgba(255,255,255,0.4);
    }
    .hero p {
      color: var(--primary-light); font-size: 17px; max-width: 520px;
      margin-bottom: 28px; line-height: 1.6; opacity: 0.85;
    }
    .hero .actions { display: flex; gap: 12px; flex-wrap: wrap; }

    /* Sections */
    .section { padding: 64px 0; }
    .section-header {
      display: flex; align-items: flex-end; justify-content: space-between;
      gap: 16px; margin-bottom: 36px; flex-wrap: wrap;
    }
    .section-header .title-group h2 {
      font-size: 30px; font-weight: 700; letter-spacing: -0.4px; color: var(--primary);
    }
    .section-header .title-group p { color: var(--muted); margin-top: 6px; font-size: 15px; }
    .section-header .view-all {
      font-weight: 600; color: var(--accent-dark);
      display: flex; align-items: center; gap: 6px; font-size: 14px;
      transition: var(--transition); white-space: nowrap;
      background: var(--accent-light); padding: 8px 20px; border-radius: 999px;
    }
    .section-header .view-all:hover { gap: 12px; background: var(--accent); color: #fff; }

    /* Categories */
    .categories-grid { display: grid; grid-template-columns: repeat(6, 1fr); gap: 18px; }
    .cat-card {
      background: var(--bg-card); border-radius: var(--radius);
      padding: 26px 16px; text-align: center; box-shadow: var(--shadow);
      transition: var(--transition); cursor: pointer; border: 2px solid transparent;
    }
    .cat-card:hover {
      transform: translateY(-8px); box-shadow: var(--shadow-hover);
      border-color: var(--accent); background: #fffbfc;
    }
    .cat-card .icon-wrap {
      width: 60px; height: 60px; border-radius: 50%;
      background: var(--accent-light); display: grid; place-items: center;
      margin: 0 auto 14px; font-size: 26px; color: var(--accent-dark);
      transition: var(--transition);
    }
    .cat-card:hover .icon-wrap {
      background: var(--accent); color: #fff; transform: scale(1.08);
    }
    .cat-card h4 { font-size: 15px; font-weight: 600; }
    .cat-card .count { font-size: 13px; color: var(--muted); margin-top: 6px; }

    /* Products */
    .products-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 22px; }
    .product-card {
      background: var(--bg-card); border-radius: var(--radius);
      overflow: hidden; box-shadow: var(--shadow);
      transition: var(--transition); display: flex; flex-direction: column;
      border: 2px solid transparent;
    }
    .product-card:hover {
      transform: translateY(-8px); box-shadow: var(--shadow-hover);
      border-color: var(--accent-light);
    }
    .product-card .img-wrap {
      position: relative; overflow: hidden; background: var(--surface); aspect-ratio: 1 / 1;
    }
    .product-card .img-wrap img {
      width: 100%; height: 100%; object-fit: cover; transition: var(--transition);
    }
    .product-card:hover .img-wrap img { transform: scale(1.05); }
    .product-card .badge {
      position: absolute; top: 12px; left: 12px;
      background: var(--accent); color: #fff;
      padding: 5px 14px; border-radius: 999px;
      font-size: 11px; font-weight: 700; letter-spacing: 0.3px;
    }
    .product-card .badge.sale { background: var(--warning); color: var(--primary); }

    .product-card .wish-btn {
      position: absolute; top: 12px; right: 12px;
      width: 38px; height: 38px; border-radius: 50%;
      background: rgba(255,255,255,0.85); display: grid; place-items: center;
      font-size: 16px; color: var(--muted); transition: var(--transition);
      backdrop-filter: blur(4px); z-index: 2;
    }
    .product-card .wish-btn:hover { background: #fff; color: var(--accent); transform: scale(1.12); }
    .product-card .wish-btn.active { background: var(--accent); color: #fff; }
    .product-card .wish-btn.active:hover { background: var(--accent-dark); color: #fff; }
    .product-card .wish-btn.pop { animation: heartPop 0.4s cubic-bezier(0.4,0,0.2,1); }
    @keyframes heartPop {
      0% { transform: scale(1); }
      40% { transform: scale(1.35); }
      100% { transform: scale(1); }
    }

    .product-card .body {
      padding: 18px 18px 14px; flex: 1; display: flex; flex-direction: column; gap: 6px;
    }
    .product-card .body .category-tag {
      font-size: 12px; color: var(--muted-light); text-transform: uppercase;
      letter-spacing: 0.6px; font-weight: 600;
    }
    .product-card .body h5 {
      font-size: 15px; font-weight: 600; line-height: 1.3;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
    }
    .product-card .body .price-row {
      display: flex; align-items: center; gap: 10px; margin-top: 4px;
    }
    .product-card .body .price { font-weight: 700; font-size: 18px; color: var(--primary); }
    .product-card .body .old-price {
      color: var(--muted-light); text-decoration: line-through; font-size: 14px;
    }
    .product-card .body .rating {
      display: flex; align-items: center; gap: 4px; font-size: 13px; color: var(--warning);
    }
    .product-card .body .rating span { color: var(--muted); font-weight: 400; }
    .product-card .footer { padding: 0 18px 18px; display: flex; gap: 10px; }
    .product-card .footer .add-btn {
      flex: 1; padding: 11px; border-radius: var(--radius-sm);
      background: var(--primary); color: #fff; font-weight: 600; font-size: 14px;
      transition: var(--transition); display: flex; align-items: center;
      justify-content: center; gap: 8px;
    }
    .product-card .footer .add-btn:hover { background: var(--accent); transform: scale(1.03); }
    .product-card .footer .add-btn.added { background: var(--success); color: var(--primary); }

    /* Deal */
    .deal-wrap {
      display: flex; background: var(--bg-card); border-radius: var(--radius);
      overflow: hidden; box-shadow: var(--shadow); border: 2px solid var(--accent-light);
    }
    .deal-wrap .deal-img { flex: 0 0 48%; background: var(--surface); min-height: 300px; }
    .deal-wrap .deal-img img { width: 100%; height: 100%; object-fit: cover; }
    .deal-wrap .deal-content {
      flex: 1; padding: 44px 48px; display: flex; flex-direction: column; justify-content: center;
    }
    .deal-wrap .deal-content .tag {
      display: inline-block; background: var(--warning); color: var(--primary);
      padding: 5px 16px; border-radius: 999px; font-size: 12px; font-weight: 700;
      text-transform: uppercase; letter-spacing: 0.5px; align-self: flex-start;
      margin-bottom: 14px;
    }
    .deal-wrap .deal-content h3 { font-size: 30px; font-weight: 700; margin-bottom: 6px; }
    .deal-wrap .deal-content .desc { color: var(--muted); margin-bottom: 18px; font-size: 15px; }
    .deal-wrap .deal-content .price-big { font-size: 34px; font-weight: 800; color: var(--primary); }
    .deal-wrap .deal-content .price-big .old {
      font-size: 20px; font-weight: 400; color: var(--muted-light);
      text-decoration: line-through; margin-left: 12px;
    }
    .deal-wrap .deal-content .stock { font-size: 14px; color: var(--muted); margin: 6px 0 18px; }
    .deal-wrap .deal-content .stock strong { color: var(--accent-dark); }

    .timer-grid { display: flex; gap: 14px; margin: 16px 0 22px; }
    .timer-box {
      background: var(--surface); color: var(--primary);
      padding: 12px 18px; border-radius: var(--radius-sm);
      min-width: 74px; text-align: center; border: 1px solid var(--accent-light);
    }
    .timer-box .num { font-size: 28px; font-weight: 700; line-height: 1.2; color: var(--accent-dark); }
    .timer-box .label {
      font-size: 11px; color: var(--muted); text-transform: uppercase;
      letter-spacing: 0.6px; margin-top: 2px;
    }

    /* Testimonials */
    .testimonials-scroll {
      display: flex; gap: 22px; overflow-x: auto; padding: 8px 4px 18px;
      scroll-snap-type: x mandatory; -webkit-overflow-scrolling: touch;
    }
    .testimonials-scroll::-webkit-scrollbar { height: 5px; }
    .testimonials-scroll::-webkit-scrollbar-thumb { background: var(--accent-light); border-radius: 999px; }
    .testimonial-card {
      flex: 0 0 360px; background: var(--bg-card); border-radius: var(--radius);
      padding: 28px 30px; box-shadow: var(--shadow);
      scroll-snap-align: start; transition: var(--transition); border: 2px solid transparent;
    }
    .testimonial-card:hover { border-color: var(--accent-light); box-shadow: var(--shadow-hover); }
    .testimonial-card .stars { color: var(--warning); font-size: 18px; letter-spacing: 2px; margin-bottom: 12px; }
    .testimonial-card blockquote {
      font-size: 15px; line-height: 1.65; color: var(--primary);
      margin-bottom: 16px; font-style: italic; opacity: 0.9;
    }
    .testimonial-card .author { display: flex; align-items: center; gap: 14px; }
    .testimonial-card .author .avatar {
      width: 48px; height: 48px; border-radius: 50%; object-fit: cover;
      background: var(--surface); border: 2px solid var(--accent-light);
    }
    .testimonial-card .author .name { font-weight: 600; font-size: 14px; }
    .testimonial-card .author .role { font-size: 13px; color: var(--muted); }

    /* Newsletter */
    .newsletter-wrap {
      background: linear-gradient(135deg, #e8d9f0 0%, #fce4e8 50%, #d9e6f2 100%);
      border-radius: var(--radius); padding: 52px 60px; color: var(--primary);
      display: flex; align-items: center; justify-content: space-between;
      gap: 32px; flex-wrap: wrap; border: 2px solid rgba(255,255,255,0.6);
      box-shadow: var(--shadow);
    }
    .newsletter-wrap .text h3 { font-size: 28px; font-weight: 700; margin-bottom: 4px; }
    .newsletter-wrap .text p { opacity: 0.75; font-size: 15px; color: var(--primary-light); }
    .newsletter-wrap form { display: flex; gap: 12px; flex-wrap: wrap; flex: 1; max-width: 480px; }
    .newsletter-wrap form input {
      flex: 1; min-width: 200px; padding: 15px 22px; border-radius: 999px;
      border: 2px solid rgba(255,255,255,0.7); font-size: 15px;
      background: rgba(255,255,255,0.55); color: var(--primary);
      transition: var(--transition); outline: none; backdrop-filter: blur(4px);
    }
    .newsletter-wrap form input::placeholder { color: var(--muted); }
    .newsletter-wrap form input:focus {
      border-color: var(--accent); background: rgba(255,255,255,0.85);
      box-shadow: 0 0 0 5px rgba(244,162,178,0.20);
    }
    .newsletter-wrap form .btn {
      background: var(--accent); color: #fff; border-color: var(--accent);
      padding: 15px 34px; box-shadow: 0 8px 24px rgba(244,162,178,0.30);
    }
    .newsletter-wrap form .btn:hover { background: var(--accent-dark); border-color: var(--accent-dark); }
    #newsletterMsg { margin-top: 14px; font-size: 14px; width: 100%; color: var(--primary); font-weight: 500; }

    /* Footer */
    footer { margin-top: 16px; padding: 48px 0 30px; border-top: 1px solid rgba(244,162,178,0.15); }
    .footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 34px; }
    .footer-grid .brand-col .brand { font-size: 20px; margin-bottom: 10px; }
    .footer-grid .brand-col p { color: var(--muted); font-size: 14px; max-width: 300px; line-height: 1.6; }
    .footer-grid .brand-col .socials { display: flex; gap: 12px; margin-top: 16px; }
    .footer-grid .brand-col .socials a {
      width: 42px; height: 42px; border-radius: 50%; background: var(--surface);
      display: grid; place-items: center; color: var(--muted);
      transition: var(--transition); font-size: 16px; border: 1px solid transparent;
    }
    .footer-grid .brand-col .socials a:hover {
      background: var(--accent); color: #fff; border-color: var(--accent); transform: translateY(-3px);
    }
    .footer-grid .col h5 { font-weight: 700; font-size: 14px; margin-bottom: 14px; color: var(--primary); }
    .footer-grid .col ul { list-style: none; display: flex; flex-direction: column; gap: 8px; }
    .footer-grid .col ul li a { color: var(--muted); font-size: 14px; transition: var(--transition); }
    .footer-grid .col ul li a:hover { color: var(--accent-dark); }
    .footer-bottom {
      text-align: center; padding-top: 22px;
      border-top: 1px solid rgba(244,162,178,0.12);
      color: var(--muted-light); font-size: 13px;
    }

    @media (max-width: 1200px) {
      .products-grid { grid-template-columns: repeat(3, 1fr); }
      .categories-grid { grid-template-columns: repeat(3, 1fr); }
      .footer-grid { grid-template-columns: 1fr 1fr; gap: 28px; }
    }
    @media (max-width: 992px) {
      .hero h1 { font-size: 38px; }
      .hero { min-height: 400px; margin: 16px 16px 0; padding: 40px 0; }
      .deal-wrap { flex-direction: column; }
      .deal-wrap .deal-img { flex: 0 0 240px; }
      .deal-wrap .deal-content { padding: 30px 34px; }
      .newsletter-wrap { padding: 36px 30px; flex-direction: column; text-align: center; }
      .newsletter-wrap form { max-width: 100%; }
      .search-wrap { min-width: 150px; }
    }
    @media (max-width: 768px) {
      nav.main-nav { display: none; }
      .mobile-toggle { display: grid; place-items: center; }
      .products-grid { grid-template-columns: repeat(2, 1fr); gap: 16px; }
      .categories-grid { grid-template-columns: repeat(2, 1fr); gap: 14px; }
      .hero h1 { font-size: 30px; }
      .hero p { font-size: 15px; }
      .section-header h2 { font-size: 24px; }
      .deal-wrap .deal-content h3 { font-size: 24px; }
      .deal-wrap .deal-content .price-big { font-size: 28px; }
      .timer-box { min-width: 58px; padding: 10px 14px; }
      .timer-box .num { font-size: 22px; }
      .footer-grid { grid-template-columns: 1fr; gap: 22px; }
      .header-inner { flex-wrap: nowrap; }
      .brand { font-size: 18px; }
      .brand i { font-size: 20px; }
      .search-wrap { min-width: 120px; padding: 0 10px 0 14px; }
      .search-wrap input { font-size: 13px; padding: 8px 0; }
      .header-actions .icon-btn { width: 36px; height: 36px; font-size: 15px; }
      .badge-count { width: 18px; height: 18px; font-size: 10px; }
      .testimonial-card { flex: 0 0 290px; }
      .hero .actions .btn { padding: 10px 22px; font-size: 14px; }
      .section { padding: 40px 0; }
    }
    @media (max-width: 480px) {
      .products-grid { grid-template-columns: 1fr 1fr; gap: 12px; }
      .categories-grid { grid-template-columns: 1fr 1fr; gap: 10px; }
      .hero { margin: 10px 10px 0; min-height: 320px; padding: 30px 0; border-radius: var(--radius-sm); }
      .hero h1 { font-size: 26px; }
      .container { padding: 0 16px; }
      .deal-wrap .deal-content { padding: 22px 20px; }
      .deal-wrap .deal-img { flex: 0 0 180px; }
      .newsletter-wrap { padding: 26px 20px; }
      .newsletter-wrap .text h3 { font-size: 22px; }
      .product-card .body { padding: 14px 14px 10px; }
      .product-card .body h5 { font-size: 13px; }
      .product-card .body .price { font-size: 16px; }
      .product-card .footer { padding: 0 14px 14px; }
      .product-card .footer .add-btn { font-size: 12px; padding: 9px; }
      .timer-box { min-width: 48px; padding: 8px 10px; }
      .timer-box .num { font-size: 18px; }
      .timer-box .label { font-size: 9px; }
      .cat-card { padding: 18px 12px; }
      .cat-card .icon-wrap { width: 46px; height: 46px; font-size: 20px; }
      .cat-card h4 { font-size: 13px; }
      .product-card .wish-btn { width: 32px; height: 32px; font-size: 14px; }
    }
  </style>
</head>

<body>

  <div class="toast" id="toast"><i class="fas fa-heart"></i> <span id="toastMsg">Added to wishlist</span></div>

  <header>
    <div class="container header-inner">
      <div style="display:flex;align-items:center;gap:12px;">
        <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu">
          <i class="fas fa-bars"></i>
        </button>
        <a class="brand" href="#">
          <i class="fas fa-leaf"></i>
          <span>Petal<span class="accent"> & Stem</span></span>
        </a>
      </div>

      <nav class="main-nav" id="mainNav" aria-label="Main navigation">
        <ul>
          <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
          <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
          <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
          <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
          <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
        </ul>
      </nav>

      <div style="display:flex;align-items:center;gap:10px;">
        <div class="search-wrap" role="search">
          <input type="search" id="searchInput" placeholder="Search products..." aria-label="Search" />
          <button id="searchBtn" aria-label="Submit search"><i class="fas fa-search"></i></button>
        </div>

        <div class="header-actions">
          <button class="icon-btn" title="Account" aria-label="Account"><i class="far fa-user"></i></button>

          <button class="icon-btn" id="wishlistBtn" title="Wishlist" aria-label="Wishlist">
            <i class="far fa-heart" id="wishlistIcon"></i>
            <span class="badge-count" id="wishlistCount" style="display:none;">0</span>
          </button>

          <div class="icon-wrap">
            <button class="icon-btn" id="cartBtn" title="Cart" aria-label="Cart">
              <i class="fas fa-shopping-bag"></i>
            </button>
            <span class="badge-count" id="cartCount">0</span>
          </div>
        </div>
      </div>
    </div>

    <div id="mobileMenu">
      <div class="container">
        <ul>
          <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
          <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
          <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
          <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
          <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
          <li><a href="#"><i class="far fa-user"></i> Account</a></li>
          <li><a href="#" id="mobileWishlistLink"><i class="far fa-heart"></i> Wishlist <span id="mobileWishlistCount" style="margin-left:auto;background:var(--accent);color:#fff;font-size:11px;padding:2px 8px;border-radius:999px;display:none;">0</span></a></li>
        </ul>
      </div>
    </div>
  </header>

  <main>
    <section class="hero" aria-label="Hero banner">
      <div class="container">
        <div class="badge"><i class="fas fa-sparkles"></i> New Collection 2026</div>
        <h1>Discover Pastel <br>Essentials</h1>
        <p>Curated fashion, tech & accessories with a soft touch. Free shipping on your first order — limited-time pastel deals await.</p>
        <div class="actions">
          <button class="btn btn-primary" id="shopNow"><i class="fas fa-arrow-right"></i> Shop Now</button>
          <button class="btn btn-ghost" id="exploreDeals"><i class="fas fa-clock"></i> Explore Deals</button>
        </div>
      </div>
    </section>

    <section class="section" id="categories" aria-labelledby="cat-title">
      <div class="container">
        <div class="section-header">
          <div class="title-group">
            <h2 id="cat-title">Browse Categories</h2>
            <p>Find exactly what you're looking for</p>
          </div>
          <a href="#" class="view-all">All Categories <i class="fas fa-arrow-right"></i></a>
        </div>
        <div class="categories-grid" id="categoriesGrid" aria-live="polite"></div>
      </div>
    </section>

    <section class="section" id="products" aria-labelledby="prod-title">
      <div class="container">
        <div class="section-header">
          <div class="title-group">
            <h2 id="prod-title">Trending Now</h2>
            <p>What's hot — popular picks from our community</p>
          </div>
          <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
        </div>
        <div class="products-grid" id="productsGrid" aria-live="polite"></div>
      </div>
    </section>

    <section class="section" id="deals" aria-labelledby="deals-title">
      <div class="container">
        <div class="section-header">
          <div class="title-group">
            <h2 id="deals-title">⚡ Flash Deal</h2>
            <p>Grab it before it's gone — limited stock</p>
          </div>
        </div>
        <div class="deal-wrap">
          <div class="deal-img">
            <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80" alt="MacBook Air M2" loading="lazy">
          </div>
          <div class="deal-content">
            <span class="tag"><i class="fas fa-bolt"></i> Limited Offer</span>
            <h3>MacBook Air M2</h3>
            <p class="desc">Thin, light, and incredibly powerful — the M2 chip redefines performance.</p>
            <div><span class="price-big">$999 <span class="old">$1,199</span></span></div>
            <p class="stock">Only <strong>12</strong> items left — hurry!</p>
            <div class="timer-grid" id="dealTimer">
              <div class="timer-box"><div class="num" id="dealDays">0</div><div class="label">Days</div></div>
              <div class="timer-box"><div class="num" id="dealHours">00</div><div class="label">Hours</div></div>
              <div class="timer-box"><div class="num" id="dealMinutes">00</div><div class="label">Mins</div></div>
              <div class="timer-box"><div class="num" id="dealSeconds">00</div><div class="label">Secs</div></div>
            </div>
            <button class="btn btn-primary" id="buyDeal"><i class="fas fa-cart-plus"></i> Add to Cart</button>
          </div>
        </div>
      </div>
    </section>

    <section class="section" id="testimonials" aria-labelledby="test-title">
      <div class="container">
        <div class="section-header">
          <div class="title-group">
            <h2 id="test-title">What Our Customers Say</h2>
            <p>Real reviews from real people</p>
          </div>
        </div>
        <div class="testimonials-scroll" id="testimonialsList"></div>
      </div>
    </section>

    <section class="section" aria-labelledby="news-title">
      <div class="container">
        <div class="newsletter-wrap">
          <div class="text">
            <h3 id="news-title">Stay in the Loop</h3>
            <p>Get exclusive offers, early access & new arrivals</p>
          </div>
          <form id="newsletterForm" onsubmit="return false;">
            <input type="email" id="newsletterEmail" placeholder="Enter your email" aria-label="Email" required />
            <button class="btn" id="subscribeBtn"><i class="fas fa-paper-plane"></i> Subscribe</button>
            <div id="newsletterMsg"></div>
          </form>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <div class="container">
      <div class="footer-grid">
        <div class="brand-col">
          <div class="brand">
            <i class="fas fa-leaf"></i>
            <span>Petal<span class="accent"> & Stem</span></span>
          </div>
          <p>Modern pastel e‑commerce demo built with care. Quality products, seamless experience.</p>
          <div class="socials">
            <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
            <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
        <div class="col">
          <h5>Company</h5>
          <ul>
            <li><a href="#">About</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="#">Press</a></li>
            <li><a href="#">Blog</a></li>
          </ul>
        </div>
        <div class="col">
          <h5>Support</h5>
          <ul>
            <li><a href="#">Help Center</a></li>
            <li><a href="#">Shipping</a></li>
            <li><a href="#">Returns</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </div>
        <div class="col">
          <h5>Legal</h5>
          <ul>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Terms</a></li>
            <li><a href="#">Cookies</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        &copy; <span id="year"></span> Petal & Stem. All rights reserved.
      </div>
    </div>
  </footer>

  <script>
    // ============================================================
    // SAFE STORAGE — never throws, works even in sandboxed iframes
    // where localStorage access is blocked (SecurityError).
    // ============================================================
    const storage = (function () {
      let available = true;
      try {
        const t = '__test__';
        window.localStorage.setItem(t, t);
        window.localStorage.removeItem(t);
      } catch (e) {
        available = false;
        console.warn('[Petal] localStorage unavailable — using in-memory store.', e);
      }
      const memory = {};
      return {
        get(key, fallback) {
          try {
            if (available) {
              const v = window.localStorage.getItem(key);
              return v ? JSON.parse(v) : fallback;
            }
            return key in memory ? memory[key] : fallback;
          } catch (e) {
            return fallback;
          }
        },
        set(key, value) {
          try {
            if (available) {
              window.localStorage.setItem(key, JSON.stringify(value));
            } else {
              memory[key] = value;
            }
          } catch (e) {
            memory[key] = value;
          }
        }
      };
    })();

    // ============================================================
    // DATA
    // ============================================================
    const CATEGORIES = [
      { id: 'phones', name: 'Smartphones', icon: 'fa-mobile-alt', count: 24 },
      { id: 'laptops', name: 'Laptops', icon: 'fa-laptop', count: 18 },
      { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt', count: 42 },
      { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones', count: 31 },
      { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints', count: 27 },
      { id: 'accessories', name: 'Accessories', icon: 'fa-watch', count: 39 }
    ];

    const PRODUCTS = [
      { id: 1, title: 'iPhone 14 Pro Max', price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: 'New',
        img: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80',
        category: 'Smartphones' },
      { id: 2, title: 'MacBook Pro 14"', price: 1999, rating: 4, reviews: 86, badge: '',
        img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80',
        category: 'Laptops' },
      { id: 3, title: 'Apple Watch Series 8', price: 349, oldPrice: 399, rating: 5, reviews: 214, badge: 'Sale',
        img: 'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80',
        category: 'Accessories' },
      { id: 4, title: 'Nike Air Max 270', price: 150, rating: 4, reviews: 53, badge: '',
        img: 'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80',
        category: 'Footwear' },
      { id: 5, title: 'Sony A7 IV Camera', price: 2499, rating: 5, reviews: 42, badge: 'New',
        img: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80',
        category: 'Gadgets' },
      { id: 6, title: 'Chanel No. 5', price: 120, rating: 5, reviews: 189, badge: '',
        img: 'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80',
        category: 'Accessories' },
      { id: 7, title: 'Travel Backpack', price: 79, oldPrice: 99, rating: 4, reviews: 67, badge: 'Sale',
        img: 'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80',
        category: 'Accessories' },
      { id: 8, title: 'Sony WH-1000XM5', price: 399, rating: 5, reviews: 156, badge: '',
        img: 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80',
        category: 'Gadgets' }
    ];

    const TESTIMONIALS = [
      { name: 'Ava Martin', role: 'Verified Buyer',
        avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80',
        text: 'Fast shipping and excellent support. The product exceeded my expectations!', stars: 5 },
      { name: 'Michael Lee', role: 'Frequent Shopper',
        avatar: 'https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80',
        text: 'Great selection and smooth checkout. Will definitely shop again.', stars: 4 },
      { name: 'Sophia Chen', role: 'Designer',
        avatar: 'https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=80&q=80',
        text: 'Love the quality and the packaging. Everything arrived in perfect condition.', stars: 5 },
      { name: 'James Wilson', role: 'Tech Enthusiast',
        avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80',
        text: 'Amazing prices on electronics. The M2 MacBook deal was unbeatable.', stars: 5 }
    ];

    // ============================================================
    // STATE
    // ============================================================
    let cartCount = 0;
    let wishlist = storage.get('petalWishlist', []);

    // ============================================================
    // DOM REFS
    // ============================================================
    const categoriesGrid = document.getElementById('categoriesGrid');
    const productsGrid = document.getElementById('productsGrid');
    const cartCountEl = document.getElementById('cartCount');
    const wishlistCountEl = document.getElementById('wishlistCount');
    const wishlistIcon = document.getElementById('wishlistIcon');
    const wishlistBtn = document.getElementById('wishlistBtn');
    const mobileWishlistCount = document.getElementById('mobileWishlistCount');
    const searchInput = document.getElementById('searchInput');
    const searchBtn = document.getElementById('searchBtn');
    const mobileToggle = document.getElementById('mobileToggle');
    const mobileMenu = document.getElementById('mobileMenu');
    const newsletterForm = document.getElementById('newsletterForm');
    const newsletterEmail = document.getElementById('newsletterEmail');
    const newsletterMsg = document.getElementById('newsletterMsg');
    const testimonialsList = document.getElementById('testimonialsList');
    const toast = document.getElementById('toast');
    const toastMsg = document.getElementById('toastMsg');

    // ============================================================
    // TOAST
    // ============================================================
    let toastTimer;
    function showToast(message, icon = 'fa-heart') {
      toastMsg.textContent = message;
      toast.querySelector('i').className = 'fas ' + icon;
      toast.classList.add('show');
      clearTimeout(toastTimer);
      toastTimer = setTimeout(() => toast.classList.remove('show'), 2200);
    }

    // ============================================================
    // WISHLIST
    // ============================================================
    function updateWishlistUI() {
      const count = wishlist.length;

      if (count > 0) {
        wishlistCountEl.textContent = count;
        wishlistCountEl.style.display = 'grid';
        wishlistIcon.className = 'fas fa-heart';
        wishlistBtn.style.color = 'var(--accent-dark)';
      } else {
        wishlistCountEl.style.display = 'none';
        wishlistIcon.className = 'far fa-heart';
        wishlistBtn.style.color = '';
      }

      if (mobileWishlistCount) {
        if (count > 0) {
          mobileWishlistCount.textContent = count;
          mobileWishlistCount.style.display = 'inline-block';
        } else {
          mobileWishlistCount.style.display = 'none';
        }
      }

      if (count > 0) {
        wishlistCountEl.style.transform = 'scale(1.3)';
        setTimeout(() => wishlistCountEl.style.transform = 'scale(1)', 200);
      }

      document.querySelectorAll('.wish-btn').forEach(btn => {
        const id = Number(btn.dataset.id);
        const heart = btn.querySelector('i');
        if (wishlist.includes(id)) {
          btn.classList.add('active');
          heart.className = 'fas fa-heart';
          btn.setAttribute('aria-pressed', 'true');
        } else {
          btn.classList.remove('active');
          heart.className = 'far fa-heart';
          btn.setAttribute('aria-pressed', 'false');
        }
      });
    }

    function toggleWishlist(productId, btnEl) {
      const id = Number(productId);
      const product = PRODUCTS.find(p => p.id === id);
      if (!product) return;

      const idx = wishlist.indexOf(id);
      if (idx > -1) {
        wishlist.splice(idx, 1);
        showToast('Removed from wishlist', 'fa-heart-broken');
      } else {
        wishlist.push(id);
        showToast(`"${product.title}" added to wishlist`, 'fa-heart');
      }

      storage.set('petalWishlist', wishlist);
      updateWishlistUI();

      if (btnEl) {
        btnEl.classList.remove('pop');
        void btnEl.offsetWidth;
        btnEl.classList.add('pop');
        setTimeout(() => btnEl.classList.remove('pop'), 450);
      }
    }

    // ============================================================
    // RENDER
    // ============================================================
    function renderCategories() {
      categoriesGrid.innerHTML = '';
      CATEGORIES.forEach(cat => {
        const el = document.createElement('div');
        el.className = 'cat-card';
        el.innerHTML = `
          <div class="icon-wrap"><i class="fas ${cat.icon}"></i></div>
          <h4>${cat.name}</h4>
          <div class="count">${cat.count} items</div>
        `;
        el.addEventListener('click', () => {
          searchInput.value = cat.name;
          filterProducts(cat.name);
          document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
        categoriesGrid.appendChild(el);
      });
    }

    function renderProducts(list) {
      productsGrid.innerHTML = '';
      if (!list.length) {
        productsGrid.innerHTML =
          `<p style="grid-column:1/-1;text-align:center;padding:40px;color:var(--muted);">No products found.</p>`;
        return;
      }
      list.forEach(p => {
        const el = document.createElement('article');
        el.className = 'product-card';
        const badgeClass = p.badge === 'Sale' ? 'sale' : '';
        const badgeHtml = p.badge ? `<span class="badge ${badgeClass}">${p.badge}</span>` : '';
        const oldPriceHtml = p.oldPrice ? `<span class="old-price">$${p.oldPrice.toLocaleString()}</span>` : '';
        const stars = '★'.repeat(Math.round(p.rating)) + '☆'.repeat(5 - Math.round(p.rating));
        const isWishlisted = wishlist.includes(p.id);
        const heartClass = isWishlisted ? 'fas fa-heart' : 'far fa-heart';
        const activeClass = isWishlisted ? 'active' : '';

        el.innerHTML = `
          <div class="img-wrap">
            <img src="${p.img}" alt="${escapeHtml(p.title)}" loading="lazy">
            ${badgeHtml}
            <button class="wish-btn ${activeClass}" data-id="${p.id}" aria-label="Toggle wishlist" aria-pressed="${isWishlisted}">
              <i class="${heartClass}"></i>
            </button>
          </div>
          <div class="body">
            <div class="category-tag">${p.category}</div>
            <h5>${escapeHtml(p.title)}</h5>
            <div class="price-row">
              <span class="price">$${p.price.toLocaleString()}</span>
              ${oldPriceHtml}
            </div>
            <div class="rating">${stars} <span>(${p.reviews})</span></div>
          </div>
          <div class="footer">
            <button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add</button>
          </div>
        `;
        productsGrid.appendChild(el);
      });

      productsGrid.querySelectorAll('.add-btn').forEach(btn => {
        btn.addEventListener('click', function (e) {
          e.stopPropagation();
          addToCart(Number(this.dataset.id), this);
        });
      });

      productsGrid.querySelectorAll('.wish-btn').forEach(btn => {
        btn.addEventListener('click', function (e) {
          e.stopPropagation();
          toggleWishlist(Number(this.dataset.id), this);
        });
      });
    }

    function renderTestimonials() {
      testimonialsList.innerHTML = '';
      TESTIMONIALS.forEach(t => {
        const stars = '★'.repeat(t.stars) + '☆'.repeat(5 - t.stars);
        const el = document.createElement('div');
        el.className = 'testimonial-card';
        el.innerHTML = `
          <div class="stars">${stars}</div>
          <blockquote>“${escapeHtml(t.text)}”</blockquote>
          <div class="author">
            <img class="avatar" src="${t.avatar}" alt="${escapeHtml(t.name)}" loading="lazy">
            <div>
              <div class="name">${escapeHtml(t.name)}</div>
              <div class="role">${escapeHtml(t.role)}</div>
            </div>
          </div>
        `;
        testimonialsList.appendChild(el);
      });
    }

    // ============================================================
    // UTILITIES
    // ============================================================
    function escapeHtml(text) {
      return String(text).replace(/[&<>"']/g, s => ({
        '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;'
      }[s]));
    }

    function updateCartCount() {
      cartCountEl.textContent = cartCount;
      cartCountEl.style.transform = 'scale(1.3)';
      setTimeout(() => cartCountEl.style.transform = 'scale(1)', 200);
    }

    function addToCart(productId, btnEl) {
      const p = PRODUCTS.find(x => x.id === productId);
      if (!p) return;
      cartCount++;
      updateCartCount();
      if (btnEl) {
        const orig = btnEl.innerHTML;
        btnEl.innerHTML = '<i class="fas fa-check"></i> Added';
        btnEl.classList.add('added');
        setTimeout(() => {
          btnEl.innerHTML = orig;
          btnEl.classList.remove('added');
        }, 1500);
      }
      showToast(`"${p.title}" added to cart`, 'fa-shopping-bag');
    }

    function filterProducts(query) {
      const q = String(query || '').trim().toLowerCase();
      if (!q) { renderProducts(PRODUCTS); return; }
      const filtered = PRODUCTS.filter(p =>
        p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q)
      );
      renderProducts(filtered);
    }

    // ============================================================
    // DEAL TIMER
    // ============================================================
    (function setupDealTimer() {
      const now = new Date();
      const target = new Date(now.getTime() + (24 * 60 + 36) * 60 * 1000);
      function tick() {
        const diff = target - new Date();
        if (diff <= 0) {
          ['dealDays','dealHours','dealMinutes','dealSeconds'].forEach(id => {
            document.getElementById(id).textContent = id === 'dealDays' ? '0' : '00';
          });
          return;
        }
        const days = Math.floor(diff / (24 * 3600 * 1000));
        const hours = Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000));
        const mins = Math.floor((diff % (3600 * 1000)) / (60 * 1000));
        const secs = Math.floor((diff % (60 * 1000)) / 1000);
        document.getElementById('dealDays').textContent = days;
        document.getElementById('dealHours').textContent = String(hours).padStart(2, '0');
        document.getElementById('dealMinutes').textContent = String(mins).padStart(2, '0');
        document.getElementById('dealSeconds').textContent = String(secs).padStart(2, '0');
      }
      tick();
      setInterval(tick, 1000);
    })();

    // ============================================================
    // EVENT BINDINGS
    // ============================================================
    searchBtn.addEventListener('click', () => filterProducts(searchInput.value));
    searchInput.addEventListener('keydown', e => { if (e.key === 'Enter') filterProducts(e.target.value); });

    mobileToggle.addEventListener('click', () => {
      const isOpen = mobileMenu.style.display === 'block';
      mobileMenu.style.display = isOpen ? 'none' : 'block';
      mobileToggle.innerHTML = isOpen ? '<i class="fas fa-bars"></i>' : '<i class="fas fa-times"></i>';
    });

    mobileMenu.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        mobileMenu.style.display = 'none';
        mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
      });
    });

    document.getElementById('shopNow').addEventListener('click', () => {
      document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
    document.getElementById('exploreDeals').addEventListener('click', () => {
      document.getElementById('deals').scrollIntoView({ behavior: 'smooth', block: 'start' });
    });

    document.getElementById('buyDeal').addEventListener('click', function () {
      cartCount++;
      updateCartCount();
      const orig = this.innerHTML;
      this.innerHTML = '<i class="fas fa-check"></i> Added!';
      this.style.background = 'var(--success)';
      this.style.color = 'var(--primary)';
      showToast('MacBook Air M2 added to cart', 'fa-shopping-bag');
      setTimeout(() => {
        this.innerHTML = orig;
        this.style.background = '';
        this.style.color = '';
      }, 1600);
    });

    wishlistBtn.addEventListener('click', () => {
      if (wishlist.length === 0) {
        showToast('Your wishlist is empty — tap a heart to save items', 'fa-heart');
        return;
      }
      const names = wishlist.map(id => {
        const p = PRODUCTS.find(x => x.id === id);
        return p ? p.title : '';
      }).filter(Boolean);
      showToast(`${wishlist.length} item${wishlist.length > 1 ? 's' : ''} in wishlist: ${names.slice(0, 2).join(', ')}${names.length > 2 ? '…' : ''}`, 'fa-heart');
    });

    newsletterForm.addEventListener('submit', e => {
      e.preventDefault();
      const email = newsletterEmail.value.trim();
      if (!email || !email.includes('@')) {
        newsletterMsg.textContent = 'Please enter a valid email address.';
        newsletterMsg.style.color = '#d9839a';
        newsletterMsg.style.display = 'block';
        return;
      }
      newsletterMsg.textContent = '🎉 Thanks for subscribing!';
      newsletterMsg.style.color = '#6a8f7a';
      newsletterMsg.style.display = 'block';
      newsletterEmail.value = '';
      setTimeout(() => { newsletterMsg.style.display = 'none'; }, 3500);
    });

    document.getElementById('cartBtn').addEventListener('click', () => {
      alert(`🛒 Your cart has ${cartCount} item${cartCount !== 1 ? 's' : ''}.`);
    });

    document.getElementById('year').textContent = new Date().getFullYear();

    // ============================================================
    // INIT — order matters: render first, then UI sync
    // ============================================================
    renderCategories();
    renderProducts(PRODUCTS);
    renderTestimonials();
    updateCartCount();
    updateWishlistUI();

    window.addEventListener('resize', () => {
      if (window.innerWidth > 768) {
        mobileMenu.style.display = 'none';
        mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
      }
    });

    console.log('🌸 Petal & Stem loaded — products rendered:', PRODUCTS.length);
  </script>

</body>
</html>
