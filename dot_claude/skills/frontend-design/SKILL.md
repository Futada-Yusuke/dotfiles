---
name: frontend-design
description: Create distinctive, context-specific frontend designs that avoid generic aesthetics. Use this when building web interfaces, React components, or HTML/CSS artifacts.
allowed-tools: Write, Edit, Read, Glob, Grep, WebFetch
---

# フロントエンドデザインスキル

## 目的

このスキルは、Claudeが生成するフロントエンドデザインの「distributional convergence」（一般的で退屈なデザインに収束する傾向）を解決するためのものです。具体的には、Inter フォント、紫のグラデーション、最小限のアニメーションといった「安全な」デザイン選択ではなく、コンテキストに応じた独創的で魅力的なフロントエンドを作成します。

## いつこのスキルを使うか

以下のような場合に**必ず**このスキルを適用する：

1. **Webインターフェースの作成**
   - 単一ページのHTMLアプリケーション
   - Reactコンポーネントの開発
   - アーティファクトの生成

2. **デザインの改善**
   - 既存のUIのリファクタリング
   - より魅力的な見た目への変更
   - ブランドアイデンティティの確立

3. **プロトタイプの作成**
   - モックアップやデモの作成
   - コンセプトの可視化

## 核となる原則

**コンテキストに特化した独創的なデザインを作成し、ユーザーを驚かせ喜ばせること**を最優先します。一般的で個性のない「クッキーカッター」デザインは避けてください。

## 4つのデザインディメンション

### 1. タイポグラフィ

**避けるべきもの：**
- Inter、Roboto などの一般的で退屈なフォント
- 単一のフォントファミリーのみの使用
- コントラストのない組み合わせ

**推奨アプローチ：**
- Playfair Display、Space Grotesk、Crimson Text、DM Serif Display などの特徴的なフォントを使用
- 見出しと本文で高いコントラストを持つフォントペアリングを実装
- フォントウェイト、サイズ、レターススペーシングで視覚的なヒエラルキーを確立
- Google Fonts や他のCDNから適切なフォントを読み込む

**実装例：**
```css
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Space+Grotesk:wght@300;400&display=swap');

:root {
  --font-heading: 'Playfair Display', serif;
  --font-body: 'Space Grotesk', sans-serif;
}

h1, h2, h3 {
  font-family: var(--font-heading);
  font-weight: 700;
  letter-spacing: -0.02em;
}

body, p {
  font-family: var(--font-body);
  font-weight: 300;
}
```

### 2. カラー & テーマ

**避けるべきもの：**
- デフォルトの紫のグラデーション
- 単調な配色
- ハードコードされた色の値

**推奨アプローチ：**
- CSS変数を使用して統一された配色システムを確立
- 支配的な色と鮮やかなアクセントカラーの組み合わせ
- IDE テーマ（例：Dracula、Nord、Monokai、Tokyo Night）からインスピレーションを得る
- ダークモード/ライトモードの両方に対応した色の設計

**実装例：**
```css
/* Dracula-inspired theme */
:root {
  --color-bg: #282a36;
  --color-surface: #44475a;
  --color-primary: #bd93f9;
  --color-secondary: #ff79c6;
  --color-accent: #50fa7b;
  --color-text: #f8f8f2;
  --color-text-muted: #6272a4;
}

/* Tokyo Night-inspired theme */
:root {
  --color-bg: #1a1b26;
  --color-surface: #24283b;
  --color-primary: #7aa2f7;
  --color-secondary: #bb9af7;
  --color-accent: #9ece6a;
  --color-text: #c0caf5;
  --color-text-muted: #565f89;
}
```

### 3. モーション & アニメーション

**避けるべきもの：**
- アニメーションの完全な欠如
- 過度に複雑なアニメーション
- 無意味な動き

**推奨アプローチ：**
- ページロード時に調整されたスタッガード効果（staggered reveals）を実装
- ホバー、クリック、フォーカス時のマイクロインタラクションを追加
- CSS アニメーションと transitions を優先（パフォーマンスのため）
- ease-in-out、cubic-bezier などの自然なイージング関数を使用

**実装例：**
```css
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.card {
  animation: fadeInUp 0.6s ease-out;
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.card:hover {
  transform: translateY(-4px);
}

/* スタッガード効果 */
.card:nth-child(1) { animation-delay: 0.1s; }
.card:nth-child(2) { animation-delay: 0.2s; }
.card:nth-child(3) { animation-delay: 0.3s; }
```

### 4. 背景 & レイヤー

**避けるべきもの：**
- 平坦な単色の背景
- 深みのないデザイン
- テクスチャの欠如

**推奨アプローチ：**
- グラデーションとパターンを重ねて深みを作る
- CSS グラデーション、SVG パターン、または subtle なノイズテクスチャを使用
- 複数のレイヤーを使用して視覚的な豊かさを追加
- backdrop-filter でガラスモーフィズム効果を検討

**実装例：**
```css
body {
  background:
    linear-gradient(135deg, rgba(138, 43, 226, 0.1) 0%, rgba(255, 20, 147, 0.1) 100%),
    radial-gradient(circle at 20% 50%, rgba(138, 43, 226, 0.2) 0%, transparent 50%),
    radial-gradient(circle at 80% 80%, rgba(255, 20, 147, 0.2) 0%, transparent 50%),
    #1a1a2e;
  background-attachment: fixed;
}

.glass-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 16px;
}
```

## 技術スタック別の実装

### React + Tailwind CSS + shadcn/ui の場合

- shadcn/ui のコンポーネントライブラリを活用して、よりリッチなUIを構築
- Tailwind の設定ファイルでカスタムカラー、フォント、アニメーションを定義
- `className` でユーティリティクラスを組み合わせて独自のスタイルを作成

**tailwind.config.js の例：**
```javascript
module.exports = {
  theme: {
    extend: {
      fontFamily: {
        heading: ['Playfair Display', 'serif'],
        body: ['Space Grotesk', 'sans-serif'],
      },
      colors: {
        bg: '#1a1b26',
        surface: '#24283b',
        primary: '#7aa2f7',
        secondary: '#bb9af7',
        accent: '#9ece6a',
      },
      animation: {
        'fade-in-up': 'fadeInUp 0.6s ease-out',
      },
      keyframes: {
        fadeInUp: {
          '0%': { opacity: '0', transform: 'translateY(20px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      },
    },
  },
}
```

### 単一ファイル HTML の場合

- `<style>` タグ内で包括的なCSSを記述
- Google Fonts などの外部フォントを `<link>` で読み込む
- CSS変数を活用してテーマの一貫性を保つ

**HTML構造の例：**
```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>タイトル</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Space+Grotesk:wght@300;400&display=swap" rel="stylesheet">
  <style>
    :root {
      --font-heading: 'Playfair Display', serif;
      --font-body: 'Space Grotesk', sans-serif;
      --color-bg: #1a1b26;
      --color-primary: #7aa2f7;
    }
    /* 追加のスタイル */
  </style>
</head>
<body>
  <!-- コンテンツ -->
</body>
</html>
```

## デザインチェックリスト

コードを生成する前に、以下の点を確認してください：

- [ ] 一般的なフォント（Inter、Roboto）を避け、特徴的なフォントを選択した
- [ ] 高いコントラストを持つフォントペアリングを実装した
- [ ] CSS変数を使用した統一された配色システムを確立した
- [ ] IDE テーマや独自の配色からインスピレーションを得た
- [ ] ページロード時のアニメーション（スタッガード効果）を実装した
- [ ] ホバーやクリック時のマイクロインタラクションを追加した
- [ ] グラデーション、パターン、またはテクスチャを使用した背景を作成した
- [ ] 全体的に独創的で、コンテキストに特化したデザインになっている

## レイアウトとコンポジションのガイドライン

### 避けるべきレイアウトパターン

- 完全に中央揃えのみのレイアウト
- 一律の border-radius（すべて同じ丸み）
- グリッドシステムの過度な対称性

### 推奨アプローチ

- 非対称なレイアウトで視覚的な興味を追加
- 異なる border-radius を使用して変化をつける
- ホワイトスペースを効果的に使用
- 視線の流れを意識した配置

## パフォーマンスとアクセシビリティ

デザインの独創性を追求しつつも、以下の点に注意：

- **パフォーマンス**: アニメーションは `transform` と `opacity` を優先（GPUアクセラレーション）
- **アクセシビリティ**: 適切なカラーコントラスト比（WCAG AA: 4.5:1 以上）
- **レスポンシブ**: モバイルファーストで設計
- **フォールバック**: ブラウザ互換性を考慮

## 最終目標

**「驚きと喜び」を生み出すフロントエンドを作成すること**

一般的でクッキーカッターなデザインではなく、ユーザーのコンテキストやプロジェクトの性質に合わせた、記憶に残る独創的なフロントエンドを生成してください。デザインは、ユーザーの目的、ブランド、対象オーディエンスに応じてカスタマイズされるべきです。
