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
      ('2','Whiskers','cat','Siamese',5,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (3,'Buddy','dog','Labrador Retriever',2,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (4,'Mittens','cat','Tabby',4,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (5,'Princess','dog','Poodle',1,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (6,'Simba','cat','Lion',6,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (7,'Max','dog','German Shepherd',3,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (8,'Luna','cat','Calico',2,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (9,'Charlie','dog','Bulldog',5,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (10,'Socks','cat','Black and White',4,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (11,'Rocky','dog','Boxer',3,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (12,'Tiger','cat','Tiger',6,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (13,'Daisy','dog','Beagle',2,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (14,'Bella','dog','Shih Tzu',4,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (15,'Shadow','cat','Persian',3,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (16,'Gizmo','dog','Chihuahua',1,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (17,'Mochi','cat','Japanese Bobtail',2,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (18,'Rufus','dog','Cocker Spaniel',5,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (19,'Samantha','cat','Maine Coon',6,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (20,'Jasper','dog','Bichon Frise',4,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (21,'Oliver','cat','British Shorthair',3,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (22,'Zeus','dog','Great Dane',2,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (23,'Athena','cat','Sphynx',1,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (24,'Cooper','dog','Australian Shepherd',5,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (25,'Nala','cat','Ragdoll',6,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,''),
      (26,'Harley','dog','Siberian Husky',4,100.00,'https://image.petmd.com/files/styles/863x625/public/2022-10/iStock-1397267365.jpg',0,'')''',
      );
      return;
    });
  }
}
