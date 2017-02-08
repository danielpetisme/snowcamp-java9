module papaya.web {
        // JDK modules
        requires java.xml.bind;
        // automatic modules
        requires vertx.core;
        requires vertx.web;

        exports io.snowcamp.papaya.web;
}