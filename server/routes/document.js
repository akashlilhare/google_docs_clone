const express = require("express");
const Document = require("../models/document");
const auth = require("../middlewares/auth");
const documentRouter = express.Router();

documentRouter.post("/doc/create", auth, async (req, res) => {
  try {
    const { createdAt } = req.body;
    let document = new Document({
      uid: req.user,
      title: "Untitled Document",
      createdAt,
    });
    document = await document.save();
    res.json(document);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

documentRouter.get("/docs/me", auth, async (req, res) => {
  try {
    let document = await Document.find({ uid: req.user });
    res.json(document);
  } catch (e) {
    console.log("docs/me error");
    console.log(e.message);
    res.status(500).json({ error: e.message });
  }
});

documentRouter.post("/doc/title", auth, async (req, res) => {
  try {
    const { id, title } = req.body;
    const document = await Document.findByIdAndUpdate(id, { title });
    res.json(document);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

documentRouter.get("/docs/me", auth, async (req, res) => {
  try {
    let document = await Document.find({ uid: req.user });
    res.json(document);
  } catch (e) {
    console.log("docs/me error");
    console.log(e.message);
    res.status(500).json({ error: e.message });
  }
});

documentRouter.get("/doc/:id", auth, async (req, res) => {
  try {
    let document = await Document.findById(req.params.id);
    res.json(document);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = documentRouter;
