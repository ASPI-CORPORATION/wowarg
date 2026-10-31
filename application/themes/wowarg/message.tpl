<!DOCTYPE html>
<html lang="es">
<head>
    <title>{$title}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background: #101F35;
            color: #C8D8E8;
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            padding: 40px 32px;
            background-image: radial-gradient(ellipse at center, rgba(116,172,223,0.08) 0%, transparent 70%);
        }
        .wa-msg-icon {
            font-size: 64px;
            margin-bottom: 28px;
            display: block;
        }
        h1 {
            font-family: Georgia, 'Times New Roman', serif;
            font-size: clamp(26px, 5vw, 46px);
            color: #FFFFFF;
            margin-bottom: 18px;
            text-shadow: 0 2px 16px rgba(0,0,0,0.7);
            letter-spacing: 0.02em;
        }
        p {
            font-size: 16px;
            color: #7B97B5;
            max-width: 520px;
            line-height: 1.75;
            margin: 0 auto;
        }
        .wa-msg-divider {
            width: 80px;
            height: 2px;
            background: linear-gradient(to right, transparent, #F6B40E, transparent);
            margin: 24px auto;
            opacity: 0.6;
        }
    </style>
</head>
<body>
    <span class="wa-msg-icon">⚔️</span>
    <h1>{$headline}</h1>
    <div class="wa-msg-divider"></div>
    <p>{$message}</p>
</body>
</html>
