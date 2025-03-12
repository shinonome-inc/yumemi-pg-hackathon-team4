import 'package:client/models/models.dart';

final now = DateTime.now();

// ユーザー定義
final user1 = User(
  id: 'user1-id',
  name: 'ジェーン・ドウ',
  imageUrl: 'https://example.com/image.jpg',
  profileDescription: 'こんにちは、ジェーン・ドウです。',
  createdAt: now,
);

final user2 = User(
  id: 'user2-id',
  name: 'ジョン・ドス',
  imageUrl: 'https://example.com/image.jpg',
  profileDescription: 'こんにちは、ジョン・ドスです。',
  createdAt: now,
);

final user3 = User(
  id: 'user3-id',
  name: 'アリス・ドウ',
  imageUrl: 'https://example.com/image.jpg',
  profileDescription: 'こんにちは、アリス・ドウです。',
  createdAt: now,
);

// コメント定義
final comments = [
  Comment(
    id: 'comment1-id',
    user: user1,
    contentText: 'これはコメントです。',
    imageUrl: 'https://example.com/image.jpg',
    createdAt: now,
    updatedAt: now,
  ),
  Comment(
    id: 'comment2-id',
    user: user2,
    contentText: 'これは別のコメントです。',
    imageUrl: 'https://example.com/image.jpg',
    createdAt: now,
    updatedAt: now,
  ),
  Comment(
    id: 'comment3-id',
    user: user3,
    contentText: 'これはさらに別のコメントです。',
    imageUrl: 'https://example.com/image.jpg',
    createdAt: now,
    updatedAt: now,
  ),
];

// 料理手順定義
final cookingSteps = [
  const CookingSteps(
    id: 'cookingStep1-id',
    description: '料理手順1',
    imageUrl: 'https://example.com/image.jpg',
  ),
  const CookingSteps(
    id: 'cookingStep2-id',
    description: '料理手順2',
    imageUrl: 'https://example.com/image.jpg',
  ),
  const CookingSteps(
    id: 'cookingStep3-id',
    description: '料理手順3',
    imageUrl: 'https://example.com/image.jpg',
  ),
];

// 材料準備手順定義
final gatheringSteps = [
  const GatheringSteps(
    id: 'gatheringStep1-id',
    description: '材料準備1',
    imageUrl: 'https://example.com/image.jpg',
  ),
  const GatheringSteps(
    id: 'gatheringStep2-id',
    description: '材料準備2',
    imageUrl: 'https://example.com/image.jpg',
  ),
  const GatheringSteps(
    id: 'gatheringStep3-id',
    description: '材料準備3',
    imageUrl: 'https://example.com/image.jpg',
  ),
];

// 材料定義
final ingredients = [
  const Ingredient(
    id: 'ingredient1-id',
    ingredientName: 'ザリガニ',
    quantity: '1個',
  ),
  const Ingredient(
    id: 'ingredient2-id',
    ingredientName: 'ねこじゃらし',
    quantity: '1本',
  ),
  const Ingredient(
    id: 'ingredient3-id',
    ingredientName: 'イシダタミガイ',
    quantity: '1個',
  ),
];

// いいね定義
final likes = [
  Like(id: 'like1-id', user: user1, createdAt: now),
  Like(id: 'like2-id', user: user2, createdAt: now),
  Like(id: 'like3-id', user: user3, createdAt: now),
];

// レシピ定義
final recipes = [
  Recipe(
    id: 'recipe1-id',
    title: 'ザリガニのエビフライ',
    description: 'これはザリガニのエビフライです。',
    cookingSteps: cookingSteps,
    gatheringSteps: gatheringSteps,
    ingredients: ingredients,
    likes: likes,
    comments: comments,
    thumbnailImageUrls: ['https://example.com/image.jpg'],
    user: user1,
    likesCounts: likes.length,
    aiComment: 'これはAIのコメントです。',
    tips: 'これはヒントです。',
    createdAt: now,
    updatedAt: now,
  ),
  Recipe(
    id: 'recipe2-id',
    title: 'ねこじゃらしラーメン',
    description: 'これはねこじゃらしラーメンです。',
    cookingSteps: cookingSteps,
    gatheringSteps: gatheringSteps,
    ingredients: ingredients,
    likes: likes,
    comments: comments,
    thumbnailImageUrls: ['https://example.com/image.jpg'],
    user: user2,
    likesCounts: likes.length,
    aiComment: 'これはAIのコメントです。',
    tips: 'これはヒントです。',
    createdAt: now,
    updatedAt: now,
  ),
  Recipe(
    id: 'recipe3-id',
    title: 'イシダタミガイの味噌汁',
    description: 'これはイシダタミガイの味噌汁です。',
    cookingSteps: cookingSteps,
    gatheringSteps: gatheringSteps,
    ingredients: ingredients,
    likes: likes,
    comments: comments,
    thumbnailImageUrls: ['https://example.com/image.jpg'],
    user: user3,
    likesCounts: likes.length,
    aiComment: 'これはAIのコメントです。',
    tips: 'これはヒントです。',
    createdAt: now,
    updatedAt: now,
  ),
];
