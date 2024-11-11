# Uploading Images & Metadata on IPFS

These images are algorithmically generated i.e. different layers are combined to create unique images through a computer program. Two of those images are shown below:

![alt text](nft.png)

Each of these images are created using multiple layers: top lid, bottom lid, eyeball, iris etc. Each layer has multiple alternatives which are permuted to create 10 different images.

In fact, it’s not necessary to create a collection of algorithmically generated images. You can also take any random already existing 10 images that you might like and continue with this lesson.

Now, it’s time to update these images on IPFS using Pinata. Log in to your Pinata account and click the `Upload+` button.

Now, we’ll create a metadata folder with json files containing the details and properties of these images.

Each json file in the metadata folder contains the details and properties of an image. For example, the json file for the first image is shown below:

```javascript
{

 "name": "Your Collection #1",

 "description": "Remember to replace this description",

 "image": "ipfs://NewUriToReplace/1.png",

 "dna": "5f34550a61642e6484671b7b40ca1b6489efcb91",

 "edition": 1,

 "date": 1668706038481,

 "attributes": [

   {

     "trait_type": "Background",

     "value": "Black"

   },

   {

     "trait_type": "Eyeball",

     "value": "White"

   },

   {

     "trait_type": "Eye color",

     "value": "Yellow"

   },

   {

     "trait_type": "Iris",

     "value": "Small"

   },

   {

     "trait_type": "Shine",

     "value": "Shapes"

   },

   {

     "trait_type": "Bottom lid",

     "value": "Middle"

   },

   {

     "trait_type": "Top lid",

     "value": "High"

   }

 ],

 "compiler": "HashLips Art Engine"

}
```

It contains details like name of the collection, description of collection, image URI and other attributes of the image detailing properties of layers like Eye color, Iris etc.

Once downloaded, go to every json file and replace the NewUriToreplace text with the CID of the Hashlips images folder :

image: “ipfs://NewUriToReplace/1.png”

image: “ipfs://QmdiZTaYUioc43ho8QKtqGbF2He9vA25SNUZhCnozZZJr4/1.png”

Please note that the CID will be different in your case, so update accordingly.

You can also change the name and description fields if you wish, though that’s not necessary for this lesson.

But what if we’re creating a collection of 1000 or 10,000 images? Will we replace it manually? It can also be done with the computer program as shared in the youtube video earlier in this lesson.

Also, if you’re not releasing algorithmically generated images and using a random collection of images, you can do away with the attributes part in the metadata and just have the name, description and image fields.

