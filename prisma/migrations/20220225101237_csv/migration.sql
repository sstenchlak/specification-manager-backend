-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_DataStructure" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT,
    "store" TEXT NOT NULL,
    "artifact_xml" BOOLEAN NOT NULL DEFAULT false,
    "artifact_json" BOOLEAN NOT NULL DEFAULT false,
    "artifact_csv" BOOLEAN NOT NULL DEFAULT false,
    "DataSpecificationId" TEXT NOT NULL,
    CONSTRAINT "DataStructure_DataSpecificationId_fkey" FOREIGN KEY ("DataSpecificationId") REFERENCES "DataSpecification" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_DataStructure" ("DataSpecificationId", "artifact_json", "artifact_xml", "id", "name", "store") SELECT "DataSpecificationId", "artifact_json", "artifact_xml", "id", "name", "store" FROM "DataStructure";
DROP TABLE "DataStructure";
ALTER TABLE "new_DataStructure" RENAME TO "DataStructure";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
