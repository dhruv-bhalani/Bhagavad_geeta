import 'package:flutter/material.dart';

class BhagavatGeetaModel {
  int? id, chapter_id, chapter_number, verse_number, verse_order, externalId;
  String? title, text, transliteration, word_meanings;

  BhagavatGeetaModel({
    this.id,
    this.chapter_id,
    this.chapter_number,
    this.verse_number,
    this.verse_order,
    this.externalId,
    this.title,
    this.text,
    this.transliteration,
    this.word_meanings,
  });

  factory BhagavatGeetaModel.fromJson(Map json) {
    return BhagavatGeetaModel(
      id: json['id'],
      chapter_id: json['chapter_id'],
      chapter_number: json['chapter_number'],
      verse_number: json['verse_number'],
      verse_order: json['verse_order'],
      externalId: json['externalId'],
      title: json['title'],
      text: json['text'],
      transliteration: json['transliteration'],
      word_meanings: json['word_meanings'],
    );
  }
  //Returns current class objects
}

class BhagavatGeetachaptersModel {
  int? id, chapter_number, verses_count;
  String? chapter_summary,
      chapter_summary_hindi,
      image_name,
      img,
      name,
      name_meaning,
      name_translation,
      name_transliterated;

  BhagavatGeetachaptersModel({
    this.id,
    this.chapter_number,
    this.verses_count,
    this.chapter_summary,
    this.chapter_summary_hindi,
    this.image_name,
    this.img,
    this.name,
    this.name_meaning,
    this.name_translation,
    this.name_transliterated,
  });
  factory BhagavatGeetachaptersModel.fromJson(Map json) {
    return BhagavatGeetachaptersModel(
      id: json['id'],
      chapter_number: json['chapter_number'],
      verses_count: json['verses_count'],
      chapter_summary: json['chapter_summary'],
      chapter_summary_hindi: json['chapter_summary_hindi'],
      image_name: json['image_name'],
      img: json['img'],
      name: json['name'],
      name_meaning: json['name_meaning'],
      name_translation: json['name_translation'],
      name_transliterated: json['name_transliterated'],
    );
  }
}
