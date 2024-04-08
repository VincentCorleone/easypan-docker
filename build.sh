# rm -rf easypan-backend/
# git clone https://github.com/VincentCorleone/easypan-backend.git
# /Users/vincentcorlone/.m2/wrapper/dists/apache-maven-3.9.4-bin/2vqnav6ufo1qvo5j2um40861m/apache-maven-3.9.4/bin/mvn package -f ./easypan-backend -DskipTests
# cp ./easypan-backend/target/easypan-0.0.1-SNAPSHOT.jar ./
# cp ./easypan-backend/init.sql ./

# rm -rf easypan-front/
# git clone https://github.com/VincentCorleone/easypan-front.git
# cd easypan-front/
# npm install
# npm run build
# cd ..
# cp -r ./easypan-front/dist ./




docker build -t easypan:1.0 .

# docker run -itd -e SENDER_USERNAME=$SENDER_USERNAME -e SENDER_PASSWORD=$SENDER_PASSWORD  -p 80:80 easypan:1.0
