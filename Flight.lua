#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>

// Function to generate a UUID
char* generate_uuid() {
  char* uuid = malloc(37);
  snprintf(uuid, 37, "%04x%04x-%04x-%04x-%04x-%04x%04x%04x",
    rand() & 0xffff, rand() & 0xffff,
    rand() & 0xffff,
    rand() & 0xffff | 0x4000,
    rand() & 0xffff | 0x8000,
    rand() & 0xffff, rand() & 0xffff, rand() & 0xffff);
  return uuid;
}

// Function to send a request to the create API with the UUID as the USERNAME parameter
void send_request(char* uuid) {
  // Initialize the curl library
  CURL* curl = curl_easy_init();
  if (curl) {
    // Format the URL of the create API with the UUID as the USERNAME parameter
    char url[100];
    sprintf(url, "http://localhost:8080/CreateAgent.php?USERNAME=%s", uuid);

    // Set the URL of the create API
    curl_easy_setopt(curl, CURLOPT_URL, url);

    // Send the request
    curl_easy_perform(curl);

    // Clean up the curl library
    curl_easy_cleanup(curl);
  }
}

int main(int argc, char** argv) {
  // Generate a UUID
  char* uuid = generate_uuid();

  // Send a request to the create API with the UUID as the USERNAME parameter
  send_request(uuid);

  return 0;
}
