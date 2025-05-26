# PostgreSQL Questions & Answers

### 1. What is PostgreSQL?

Answer: PostgreSQL একটি ওপেন সোর্স রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম (RDBMS) যা উন্নত ফিচার, ডেটা সঠিকভাবে সংরক্ষণ এবং জটিল কোয়েরি পরিচালনায় সক্ষম। এটি ACID-compliant, যার মানে ডেটা ট্রানজেকশনগুলো নিরাপদ ও নির্ভরযোগ্য। PostgreSQL কাস্টম ফাংশন, JSON, এবং জিওগ্রাফিক ডেটা (PostGIS) সাপোর্ট করে, তাই এটি ডেভেলপার ও এন্টারপ্রাইজ পর্যায়ে জনপ্রিয়।

### 2. What is the purpose of a database schema in PostgreSQL? <br>

Answer: PostgreSQL-এ Schema মূলত একটি আলাদা জায়গা যেখানে টেবিল, ফাংশন, ভিউ ইত্যাদি রাখা হয়। এটা ব্যবহার করার মূল কারণ হলো বড় প্রজেক্টে যাতে একই নামে একাধিক জিনিস রাখা যায় কিন্তু তারা পরস্পরের সাথে মিশে না যায়। যেমন: যদি দুইটি টেবিলের নাম users হয়, তখন আমরা তাদের আলাদা স্কিমায় রেখে সহজেই ব্যবস্থাপনা করতে পারি। এতে কোড পরিষ্কার থাকে, কনফিউশন হয় না এবং বড় সিস্টেমও সহজে পরিচালনা করা যায়।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL. <br>

Answer: Primary Key:
Primary Key হচ্ছে টেবিলের এমন একটি কলাম বা একাধিক কলাম যেগুলোর মাধ্যমে প্রতিটি রোকে আলাদা করে চেনা যায়। এটি সবসময় ইউনিক হয় এবং কখনোই NULL থাকতে পারে না। প্রতিটি টেবিলে একবারই Primary Key সেট করা যায়।

Foreign Key:
Foreign Key ব্যবহার করে এক টেবিলের সাথে আরেক টেবিলের সম্পর্ক তৈরি করা হয়। এটি মূলত এক টেবিলের (Child Table) একটি কলাম, যেখানে আরেক টেবিলের (Parent Table) প্রাইমারি বা ইউনিক কনস্ট্রেইন্টযুক্ত ভ্যালু রেফারেন্স করা হয়। এর ফলে ডাটাবেজে ডেটার মধ্যে সঠিক সংযোগ থাকে এবং ভুল ইনপুট ঢোকা থেকে রক্ষা পাওয়া যায়।

### 4. What is the difference between the VARCHAR and CHAR data types?<br>

Answer: VARCHAR এবং CHAR এর মধ্যে পার্থক্য

<table style="border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;">
  <thead>
    <tr style="background-color: #f2f2f2;">
      <th style="border: 1px solid #333; padding: 8px; text-align: left;">CHAR</th>
      <th style="border: 1px solid #333; padding: 8px; text-align: left;">VARCHAR</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #333; padding: 8px;">
        CHAR এও টেক্সট লিমিট করা যায়, কিন্তু লিমিটের থেকে কম টেক্সট লিখলেও ফাকা জায়গার জন্য স্টোরেজ দখল করবে।
      </td>
      <td style="border: 1px solid #333; padding: 8px;">
        VARCHAR এ টেক্সট লিমিট করা যায়, কিন্তু লিমিটের থেকে কম টেক্সট বাকি জায়গা কোন স্টোরেজ দখল করবে না।
      </td>
    </tr>
    <tr>
      <td style="border: 1px solid #333; padding: 8px;">
        CHAR কে বলা হয় Fixed-length character
      </td>
      <td style="border: 1px solid #333; padding: 8px;">
        VARCHAR কে বলা হয় Variable-length Character
      </td>
    </tr>
    <tr>
      <td style="border: 1px solid #333; padding: 8px;">
        CHAR এর স্পিড তুলনামূলকভাবে একটু বেশি হয়।
      </td>
      <td style="border: 1px solid #333; padding: 8px;">
        VARCHAR ব্যাবহারে ফ্লেক্সিবল এবং স্পেস ইফিসিয়েন্ট, কিন্তু স্পিড CHAR এর থেকে একটু কম হয়।
      </td>
    </tr>
  </tbody>
</table>

### 5. Explain the purpose of the WHERE clause in a SELECT statement. <br>

<i>Answer: WHERE clause SELECT statement এ ব্যাবহার করা হয় কোন স্পেসিফিক কন্ডিশনের ভিত্তিতে টেবিলের ROW রিটার্ন করানোর জন্য।</i>
