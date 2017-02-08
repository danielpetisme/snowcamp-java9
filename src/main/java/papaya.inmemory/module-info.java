module papaya.inmemory {
    requires json;
    requires papaya;
    requires papaya.doc;
    requires papaya.reflect;

    provides io.snowcamp.papaya.api.DBFactory
    with io.snowcamp.papaya.inmemory.InMemoryDBFactory;
}