#Docker related configuration, can disregard if not using Docker
if(process.env.MONGO_PORT_27017_TCP_ADDR) {
  process.env.MONGO_HOST = process.env.MONGO_PORT_27017_TCP_ADDR;
}
if(process.env.MONGO_PORT_27017_TCP_PORT) {
  process.env.MONGO_PORT = process.env.MONGO_PORT_27017_TCP_PORT;
}
if(process.env.REDIS_PORT_6379_TCP_ADDR != void 0 && process.env.REDIS_PORT_6379_TCP_PORT != void 0) {
  process.env.REDIS_HOST = process.env.REDIS_PORT_6379_TCP_ADDR;
  process.env.REDIS_PORT = process.env.REDIS_PORT_6379_TCP_PORT;
} 
process.env.MONGO_DB = "component-examples"
require('derby-starter').run __dirname, {port: 3330}