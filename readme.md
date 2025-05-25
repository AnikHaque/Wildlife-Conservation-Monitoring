# RDBMS - PostgreSQL

## Answering Question of Assignment 2

### 1. What is PostgreSQL?

Answer: PostgreSQL হলো Database Management System. PostgreSQL একটি রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম - RDBMS. পৃথিবীর সবথেকে এডভান্স ডাটাবেজগুলোর মধ্যে PostgreSQL অন্যতম। এটি একটি Open Source Database Management System যার কারণে এখানে ইন্টারন্যাশনাল বড় বড় ডেভেলপাররা কন্টিনিউয়াসলি কন্ট্রিবিউট করে এবং আপ টু ডেট রাখে, কোন বাগ থাকলে সেগুলা খুবদ্রুত ফিক্স করে এবং নতুন নতুন ফিচারস নিয়ে আসে।

### 2. What is the purpose of a database schema in PostgreSQL? <br>

<i>Answer: Schema হলো ফোল্ডারের মতো। আমারা যেমন একটি ফোল্ডারে একই নামের ফাইল একাধিকবার রাখতে পারিনা, ঐএকই নামের ফাইল আরেকটি রাখার দরকার হলে আরেকটি ফোল্ডার তৈরি করতে হয় ঠিক তেমনই আমাদের যখন বড় বড় প্রজেক্টে একই নামে একাধিক Table, Function, Procedure, views, Trigger ইত্যাদি তৈরি করতে হয় তখন আমরা ভিন্ন ভিন্ন Schema তৈরি করে ব্যবহার করতে পারি। আরেকটি অন্যতম Schema এর ব্যবহার হলো আমাদের প্রজেক্টে Table, Function, Procedure, views, Trigger এর নাম গুলো যেন একই নামে হয়ে একটি অপরটির সাথে Conflict না করে সেজন্য মূলত Schema ব্যবহার করা হয়।</i>

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL. <br>

<i>Answer: Primary Key
Primary Key হলো কোন টেবিলের নির্ধারিত কোন রো কে খুজে পাওয়ার জন্য একটি Unique Key. এটা NULL হতে পারবে না এবং একটি টেবিলে কেবলমাত্র একটি Primary Key একবারই থাকতে পারবে। Primary Key একাধিক কলাম মিলেও হতে পারে, তখন তাকে Composite Primary Key বলে।
Foreign Key
Foreign Key হলো Parent Table এবং Child Table এর মধ্যে সম্পর্ক স্থাপন করার মাধ্যম। Child Table এ Parent Table এর রেফারেন্স ধরে রাখার জন্য Child Table এ Parent Table এর Priamry Key বা অন্য যেকোন Key (যদি সেখানে UNIQUE Constraint থাকে বা Unique হয়) Foreign Key হিসাবে লিস্টেড করা হয়। কিন্তু Child Table এ ডাটা INSERT করার সময় Foreign Key এর Value যদি Parent Table এ Exist না করে তাহলে সেই ডাটা INSERT করা সম্ভব নয়।</i>

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
