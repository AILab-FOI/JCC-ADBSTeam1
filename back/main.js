import { userQueries } from "./db/userQueries.js";
import { propertiesQueries } from "./db/propertiesQueries.js";
import { landlordsQueries } from "./db/landlordsQueries.js";
import express from "express";
import cors from "cors";
import { contractQueries } from "./db/contractQueries.js";

const app = express();
const port = 10110;

const corsOptions = {
    origin:'*',
}


app.use((express.json({limit: '200mb'})));
app.use(cors(corsOptions));

app.post("/", async (req, res) => {
    let user = await userQueries.fetchUser(req.body.oib);
    res.send(JSON.stringify(user));
});

app.get("/tenant/properties", async (req, res) => {
    let properties = await propertiesQueries.fetchPropertiesForTenants();
    res.send(JSON.stringify(properties));
})

app.get("/tenant/properties/:propertyId", async (req, res) => {
    let property = await propertiesQueries.fetchSingleProperty(req.params.propertyId);
    res.json(JSON.stringify(property));
})

app.get("/tenant/contracts/:tenantOIB", async (req, res) => {
    let contracts = await propertiesQueries.fetchContractsForTenants(req.params.tenantOIB);
    res.send(JSON.stringify(contracts));
})
app.get("/tenant/utilities/:contractID", async (req, res) => {
    let utilities = await propertiesQueries.fetchUtilitiesForTenants(req.params.contractID);
    res.send(JSON.stringify(utilities));
})
app.get("/tenant/security/:contractID", async (req, res) => {
    let security = await propertiesQueries.fetchSecurityForTenants(req.params.contractID);
    res.send(JSON.stringify(security));
})
app.get("/tenant/rents/:tenantOIB", async (req, res) => {
    let rents = await propertiesQueries.fetchRentsForTenants(req.params.tenantOIB);
    res.send(JSON.stringify(rents));
})
app.get("/tenant/contracts/document/:contractID", async (req, res) => {
    let contractBlob = await propertiesQueries.fetchContractDocument(req.params.contractID);
    res.send(JSON.stringify(contractBlob));
})
app.get("/landlord/landlordproperties/:landlordOIB", async (req, res) => {
    let landlordproperties = await landlordsQueries.fetchLandlordProperties(
      req.params.landlordOIB
    );
    res.send(JSON.stringify(landlordproperties));
  });
  app.get("/landlord/rents/:landlordOIB", async (req, res) => {
    let rents = await landlordsQueries.fetchRentsForLandlords(
      req.params.landlordOIB
    );
    res.send(JSON.stringify(rents));
  });
  app.get("/landlord/utilities/:landlordOIB", async (req, res) => {
    let utilities = await landlordsQueries.fetchUtilitiesForLandlords(
      req.params.landlordOIB
    );
    res.send(JSON.stringify(utilities));
  });
  app.post("/landlord/add/contract", async (req, res) => {
    let contract = await contractQueries.createContract(req.body);
    res.send(JSON.stringify({success: "true"}))
  })
  app.get("/tenant/reminder/:contractId", async(req, res) => {
    let reminder = await contractQueries.fetchReminders(req.params.contractId);
    res.json(JSON.stringify(reminder));
  })

  app.get("/landlord/property/history/:propertyId", async (req, res) => {
    let history = await propertiesQueries.fetchPropertyHistory(req.params.propertyId);
    res.json(JSON.stringify(history));
  })

  app.get("/landlord/property/maintenance/:propertyId", async(req, res) => {
    let maintenance = await contractQueries.fetchMaintenance(req.params.propertyId);
    console.log(maintenance);
    res.json(JSON.stringify(maintenance));
  })

  app.post("/feat/update", async(req,res) => {
    //let added = await contractQueries.addFeat(req.body);
    res.json(JSON.stringify({success: "true"}))
  })

app.listen(port, () => {
    console.log(`Express app listening on port ${port}`);
});