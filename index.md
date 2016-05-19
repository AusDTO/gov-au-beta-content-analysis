---
title: API Specification [DRAFT]
---

# Table of contents

To be filled in 

# Methods

## 1. linters

Search a chunk of text for words which are discouraged from use.

### Request

| Method  | URL          |
|---------|--------------|
| POST | /api/linters |


| Type | Params  | Values |
|------|---------|--------|
| POST | content | string |

### Response

| Status | Response                            |
|--------|-------------------------------------|
|  200   |`{ <bad_word>: [<suggested_words] }` |
|  400   |`{"error": "Content missing"}`       |

## 2. content quality

Provides a quality score for a chunk of text based on the Flesch Kincaid algorithm.

### Request - /api/quality

| Method  | URL          |
|---------|--------------|
| POST | /api/quality |

| Type | Params  | Values |
|------|---------|--------|
| POST | content | string |

### Response

**Status**: 200 - Successful request  
**Response**:  

```
{  
    'name'                       => String,  
    'formula'                    => formula_class,  
    'score'                      => Float,  
    'string_length'              => Fixnum,  
    'letter_count'               => Fixnum,  
    'syllable_count'             => Fixnum,  
    'word_count'                 => Fixnum,  
    'sentence_count'             => Fixnum,  
    'average_words_per_sentence' => Float,  
    'average_syllables_per_word' => Float  
}
```

**Status**: 400 - No content  
**Response**: 

```
{ 'error': 'No content provided' }
``` 