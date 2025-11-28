# フロントエンドデザインスキルの具体例

このドキュメントでは、実際のユースケースに基づいたフロントエンドデザインスキルの効果的な使い方を示します。

## 例1: ポートフォリオサイトの作成

### ユーザーリクエスト
「デザイナーのポートフォリオサイトを作成してください」

### ❌ 一般的なアプローチ（避けるべき）

```html
<!-- Inter フォント、紫のグラデーション、最小限のスタイル -->
<style>
  body {
    font-family: 'Inter', sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }
  .card {
    background: white;
    border-radius: 8px;
    padding: 20px;
  }
</style>
```

**問題点**:
- 一般的すぎて個性がない
- どのポートフォリオサイトでも見かける配色
- デザイナーの個性が反映されていない

### ✅ 独創的なアプローチ（推奨）

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ポートフォリオ</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:wght@400;700&family=Space+Grotesk:wght@300;500&display=swap" rel="stylesheet">
  <style>
    :root {
      /* Tokyo Night inspired */
      --color-bg: #1a1b26;
      --color-surface: #24283b;
      --color-primary: #7aa2f7;
      --color-accent: #ff9e64;
      --color-text: #c0caf5;
      --font-heading: 'Crimson Text', serif;
      --font-body: 'Space Grotesk', sans-serif;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: var(--font-body);
      background:
        radial-gradient(circle at 10% 20%, rgba(122, 162, 247, 0.15) 0%, transparent 50%),
        radial-gradient(circle at 90% 80%, rgba(255, 158, 100, 0.1) 0%, transparent 50%),
        var(--color-bg);
      color: var(--color-text);
      min-height: 100vh;
      overflow-x: hidden;
    }

    h1, h2, h3 {
      font-family: var(--font-heading);
      font-weight: 700;
      letter-spacing: -0.02em;
      color: var(--color-primary);
    }

    .hero {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .hero-title {
      font-size: clamp(3rem, 10vw, 8rem);
      animation: fadeInUp 1s ease-out;
    }

    .project-card {
      background: rgba(36, 40, 59, 0.6);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(122, 162, 247, 0.2);
      border-radius: 24px;
      padding: 2rem;
      transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
      animation: fadeInUp 0.6s ease-out;
    }

    .project-card:hover {
      transform: translateY(-8px) rotate(-1deg);
      border-color: var(--color-accent);
      box-shadow: 0 20px 40px rgba(255, 158, 100, 0.2);
    }

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .project-card:nth-child(1) { animation-delay: 0.1s; }
    .project-card:nth-child(2) { animation-delay: 0.2s; }
    .project-card:nth-child(3) { animation-delay: 0.3s; }
  </style>
</head>
<body>
  <!-- コンテンツ -->
</body>
</html>
```

**メリット**:
- Tokyo Nightテーマにインスパイアされた独自の配色
- Crimson TextとSpace Groteskの組み合わせで個性を演出
- グラスモーフィズムとマイクロインタラクションで洗練された印象
- スタッガード効果で動的な体験

---

## 例2: ダッシュボードアプリケーション

### ユーザーリクエスト
「データ分析のダッシュボードUIを作成してください」

### ✅ 効果的なアプローチ

React + Tailwind CSS + shadcn/ui を使用した実装:

**tailwind.config.js:**
```javascript
module.exports = {
  darkMode: 'class',
  theme: {
    extend: {
      fontFamily: {
        sans: ['DM Sans', 'sans-serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
      colors: {
        // Monokai inspired
        bg: {
          DEFAULT: '#272822',
          secondary: '#3e3d32',
        },
        accent: {
          green: '#a6e22e',
          blue: '#66d9ef',
          yellow: '#e6db74',
          pink: '#f92672',
        },
      },
      animation: {
        'slide-in': 'slideIn 0.3s ease-out',
        'pulse-glow': 'pulseGlow 2s ease-in-out infinite',
      },
      keyframes: {
        slideIn: {
          '0%': { transform: 'translateX(-100%)', opacity: '0' },
          '100%': { transform: 'translateX(0)', opacity: '1' },
        },
        pulseGlow: {
          '0%, 100%': { boxShadow: '0 0 5px rgba(166, 226, 46, 0.5)' },
          '50%': { boxShadow: '0 0 20px rgba(166, 226, 46, 0.8)' },
        },
      },
    },
  },
}
```

**Dashboard.tsx:**
```tsx
import { Card } from '@/components/ui/card';
import { LineChart, BarChart } from '@/components/ui/chart';

export function Dashboard() {
  return (
    <div className="min-h-screen bg-bg p-8">
      <h1 className="font-sans text-5xl font-bold text-accent-green mb-8 animate-slide-in">
        Analytics Dashboard
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <Card className="bg-bg-secondary border-accent-blue/20 hover:border-accent-blue/60 transition-all duration-300 hover:scale-105 animate-slide-in">
          <div className="p-6">
            <p className="font-mono text-accent-blue text-sm">Total Users</p>
            <p className="font-sans text-4xl font-bold text-white mt-2">12,345</p>
            <p className="font-mono text-accent-green text-xs mt-1">+23.5% from last month</p>
          </div>
        </Card>

        {/* 追加のカード */}
      </div>

      <div className="mt-8 grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card className="bg-bg-secondary border-accent-pink/20 p-6 animate-pulse-glow">
          <LineChart data={chartData} />
        </Card>

        <Card className="bg-bg-secondary border-accent-yellow/20 p-6">
          <BarChart data={chartData} />
        </Card>
      </div>
    </div>
  );
}
```

**特徴**:
- Monokaiテーマのダークカラーパレット
- DM SansとJetBrains Monoでプロフェッショナルな印象
- カスタムアニメーションで動的な体験
- データの重要度に応じた色分け

---

## 例3: ランディングページ

### ユーザーリクエスト
「SaaSプロダクトのランディングページを作成してください」

### ✅ 独創的なアプローチ

**特徴的な要素:**

1. **タイポグラフィ:**
```css
@import url('https://fonts.googleapis.com/css2?family=Fraunces:wght@700&family=Public+Sans:wght@300;400;600&display=swap');

:root {
  --font-heading: 'Fraunces', serif;
  --font-body: 'Public Sans', sans-serif;
}

h1 {
  font-family: var(--font-heading);
  font-size: clamp(2.5rem, 8vw, 6rem);
  font-weight: 700;
  line-height: 1.1;
  letter-spacing: -0.03em;
}
```

2. **カラースキーム（Nord inspired）:**
```css
:root {
  --color-bg: #2e3440;
  --color-surface: #3b4252;
  --color-frost-1: #8fbcbb;
  --color-frost-2: #88c0d0;
  --color-aurora-green: #a3be8c;
  --color-aurora-red: #bf616a;
}
```

3. **背景パターン:**
```css
.hero {
  background:
    url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%238fbcbb' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E"),
    linear-gradient(135deg, var(--color-bg) 0%, var(--color-surface) 100%);
}
```

4. **マイクロインタラクション:**
```css
.cta-button {
  background: var(--color-frost-2);
  color: var(--color-bg);
  padding: 1rem 2rem;
  border-radius: 12px;
  font-weight: 600;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;
  overflow: hidden;
}

.cta-button::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.3);
  transform: translate(-50%, -50%);
  transition: width 0.6s, height 0.6s;
}

.cta-button:hover::before {
  width: 300px;
  height: 300px;
}

.cta-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 30px rgba(143, 188, 187, 0.3);
}
```

**結果**:
- Nordテーマの落ち着いた配色で信頼感を演出
- FrauncesとPublic Sansの組み合わせでモダンかつ洗練された印象
- SVGパターンとグラデーションで深みのある背景
- リップル効果でインタラクティブな体験

---

## 例4: ブログ記事ページ

### ユーザーリクエスト
「読みやすいブログ記事のレイアウトを作成してください」

### ✅ 効果的なアプローチ

**タイポグラフィ重視の設計:**

```html
<style>
@import url('https://fonts.googleapis.com/css2?family=Lora:wght@400;700&family=Source+Sans+3:wght@300;400;600&display=swap');

:root {
  --font-article: 'Lora', serif;
  --font-ui: 'Source Sans 3', sans-serif;
  --color-bg: #faf9f6;
  --color-text: #2d2d2d;
  --color-accent: #c9502d;
}

body {
  font-family: var(--font-ui);
  background: var(--color-bg);
  color: var(--color-text);
}

article {
  max-width: 65ch; /* 最適な行長 */
  margin: 0 auto;
  padding: 2rem;
  font-family: var(--font-article);
  font-size: 1.125rem;
  line-height: 1.75;
}

article h1 {
  font-size: 3rem;
  font-weight: 700;
  line-height: 1.2;
  margin-bottom: 1rem;
  color: var(--color-text);
}

article h2 {
  font-size: 2rem;
  font-weight: 700;
  margin-top: 3rem;
  margin-bottom: 1rem;
  color: var(--color-accent);
}

article p {
  margin-bottom: 1.5rem;
}

article blockquote {
  border-left: 4px solid var(--color-accent);
  padding-left: 1.5rem;
  font-style: italic;
  color: #555;
  margin: 2rem 0;
}

article a {
  color: var(--color-accent);
  text-decoration: underline;
  text-decoration-thickness: 2px;
  text-underline-offset: 3px;
  transition: all 0.2s;
}

article a:hover {
  text-decoration-thickness: 3px;
  color: #a03d1f;
}
</style>
```

**特徴**:
- Loraセリフフォントで読みやすく洗練された本文
- 最適な行長（65文字）とline-heightで可読性を最大化
- アクセントカラーで重要な要素を強調
- リンクのマイクロインタラクション

---

## チェックリスト

実装前に確認:

- [ ] ユーザーのコンテキスト（プロダクト、ブランド、オーディエンス）を理解したか？
- [ ] 一般的なフォント（Inter、Roboto）を避けたか？
- [ ] 独自の配色システムを確立したか（IDEテーマなどからインスピレーション）？
- [ ] アニメーションとマイクロインタラクションを実装したか？
- [ ] 背景に深みとテクスチャを追加したか？
- [ ] レスポンシブデザインを考慮したか？
- [ ] アクセシビリティ（コントラスト比、フォントサイズ）を確認したか？

---

## デザインパターンの組み合わせ

### プロフェッショナル × モダン
- **フォント**: DM Serif Display + Inter
- **カラー**: Monokaiベース
- **特徴**: シャープなコントラスト、クリーンなライン

### クリエイティブ × 大胆
- **フォント**: Playfair Display + Space Grotesk
- **カラー**: Draculaベース
- **特徴**: 非対称レイアウト、大きなタイポグラフィ

### ミニマル × エレガント
- **フォント**: Crimson Text + Source Sans
- **カラー**: Nordベース
- **特徴**: ホワイトスペース重視、控えめなアニメーション

### テクニカル × 洗練
- **フォント**: JetBrains Mono + Public Sans
- **カラー**: Tokyo Nightベース
- **特徴**: グリッドレイアウト、データビジュアライゼーション
