import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PetsDatabase {
  Future<Database> get database async {
    Database database = await _initDB('pets_adopt.db');
    return database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      db.execute(
        'CREATE TABLE pet(id INTEGER PRIMARY KEY,name TEXT,species TEXT,breed TEXT,age INTEGER, price REAL, image_url TEXT, is_adopted NUMBER DEFAULT 0, adopted_time TEXT)',
      );
      db.execute(
        '''INSERT INTO pet (id,name,species,breed,age,price,image_url, is_adopted, adopted_time) VALUES
      ('1','Fluffy','dog','Golden Retriever',3,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      ('2','Whiskers','cat','Siamese',5,100.00,'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQgwWTl6RtTmc4fezxTXkqWRqHFee0_4pJYBdz8eLjv6JYnLuRpo_NlsyL5UZe-uw1NsbLlDaykFowkQ2o',0,''),
      (3,'Buddy','dog','Labrador Retriever',2,100.00,'https://images.wagwalkingweb.com/media/daily_wag/blog_articles/hero/1670938235.1927571/fun-facts-about-labrador-retrievers.jpg',0,''),
      (4,'Mittens','cat','Tabby',4,100.00,'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcRsulJ6g-20jzdbezulWO3AGz3VhwsIQi4jwFJjqaMzedfl2TMJoMneIEYn_-aicMln',0,''),
      (5,'Princess','dog','Poodle',1,100.00,'https://media.istockphoto.com/id/490849353/photo/cute-white-male-poodle-puppy.jpg?s=612x612&w=0&k=20&c=kKPn9_U2N0G1OCPWIZnhHmBs7f_ZPcWAR3bzQ29njBM=',0,''),
      (6,'Simba','cat','Lion',6,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgLhXFyTF6R4xS9zs9Etj55McWOhuWlfaEatmBFUYIE4OuAEpKBBaL_c6fmgaJRR_grdU&usqp=CAU',0,''),
      (7,'Max','dog','German Shepherd',3,100.00,'https://www.ukpets.com/oc-content/uploads/breeds/0/5790.jpg',0,''),
      (8,'Luna','cat','Calico',2,100.00,'https://s36537.pcdn.co/wp-content/uploads/2018/03/Calico-cat.jpg.optimal.jpg',0,''),
      (9,'Charlie','dog','Bulldog',5,100.00,'https://drbillspetnutrition.com/wp-content/uploads/2016/06/D1-Skin-Problems.jpg',0,''),
      (10,'Socks','cat','Black and White',4,100.00,'https://media.istockphoto.com/id/1217212552/photo/black-and-white-kitten.jpg?s=612x612&w=0&k=20&c=ejeEcAy5okiANy9sqeqjSTx-EQJvScHoUEqPTNZEi2o=',0,''),
      (11,'Rocky','dog','Boxer',3,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu7q1aIcpWJS1s-asvQhFEC0T6QIuw54vKDg&usqp=CAU',0,''),
      (12,'Tiger','cat','Tiger',6,100.00,'https://www.hepper.com/wp-content/uploads/2021/10/striped-tiger-bengal-cat_shutterstock-scaled.jpg',0,''),
      (13,'Daisy','dog','Beagle',2,100.00,'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ5a8W_q4p7UkKAYOICjfTz59BR-XSKDvyI1-Aztm_XMCsROmhNMlf-Ok-l3zo4t16N1sl5LWqBo0eCnf8',0,''),
      (14,'Bella','dog','Shih Tzu',4,100.00,'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRCszg9HPX9NaiTrzOxi0Ge53ddHJy5X1qWGA-WIZ3v1_VmHWMztjbevN5NUH9oHd4rMtRhu6eK8ltjwhE',0,''),
      (15,'Shadow','cat','Persian',3,100.00,'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcTUfnrsZvHL4pnZrxIwl15EehnSt58x5XPbJUJkhEt_MGMlpXju7zkhHmTe6hi7fSJ-jwo51J-VkjALaJdV-OF5zsw2giSFIQsLlLwpMyV3',0,''),
      (16,'Gizmo','dog','Chihuahua',1,100.00,'https://www.thesprucepets.com/thmb/I1NflT-_BAWY3ir-_nSXlLGVkdM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/twenty20_f84c633e-705e-4bf8-a724-00cdea750d8d-590b51893df78c92837b18d6.jpg',0,''),
      (17,'Mochi','cat','Japanese Bobtail',2,100.00,'https://upload.wikimedia.org/wikipedia/commons/5/56/JapaneseBobtailBlueEyedMi-ke.JPG',0,''),
      (18,'Rufus','dog','Cocker Spaniel',5,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyzpWNe5wDIU1ImC1E9ye0iImHGCeK3nka3Q&usqp=CAU',0,''),
      (19,'Samantha','cat','Maine Coon',6,100.00,'https://www.thesprucepets.com/thmb/9ucrMCMSd2R_HJs_lI-kFgjaYkc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1189893683-e0ff70596b3b4f0687ba573e5a671f74.jpg',0,''),
      (20,'Jasper','dog','Bichon Frise',4,100.00,'https://cdn.britannica.com/54/236454-050-B406A11E/Bichon-frise-dog.jpg',0,''),
      (21,'Oliver','cat','British Shorthair',3,100.00,'https://www.thesprucepets.com/thmb/25bRV7b28iqalYQAYBKTj66IOdg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1319774380-c3da91f9259a47e0966007f8e10690ba.jpg',0,''),
      (22,'Zeus','dog','Great Dane',2,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk8n9F74E9gUbuzpHDBeL2raywYwArDcctEw&usqp=CAU',0,''),
      (23,'Athena','cat','Sphynx',1,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ5JHiq94ZAHBRU2UFS2Sd-IXbu-DwmEGkRA&usqp=CAU',0,''),
      (24,'Cooper','dog','Australian Shepherd',5,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT22qI_Y5F8qa7vWJ96PPz1vlTrwreA4bKFuw&usqp=CAU',0,''),
      (25,'Nala','cat','Ragdoll',6,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSQsnH17dJwWDnWzFvx9xJjGl-sja5zwnuwg&usqp=CAU',0,''),
      (26,'Harley','dog','Siberian Husky',4,100.00,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUG5Dwof5FaBgrIkL0jtgipc8A8WLWh3bc4w&usqp=CAU',0,'')''',
      );
      return;
    });
  }
}
