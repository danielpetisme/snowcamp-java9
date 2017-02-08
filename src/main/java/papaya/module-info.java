module papaya {
    // JDK modules
    requires jdk.unsupported;
    requires java.xml.bind;
    // automatic modules
    requires json;

    requires papaya.doc;
    requires papaya.reflect;

    exports io.snowcamp.papaya.spi;
    exports io.snowcamp.papaya.api;
        // io.snowcamp.papaya.inmemory is not exported
    uses io.snowcamp.papaya.api.DBFactory;
}