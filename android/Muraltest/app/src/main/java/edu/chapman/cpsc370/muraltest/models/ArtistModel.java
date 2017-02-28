package edu.chapman.cpsc370.muraltest.models;


import com.google.firebase.database.ValueEventListener;

import edu.chapman.cpsc370.muraltest.ArtistValueEventListener;
import edu.chapman.cpsc370.muraltest.FIRQueryHelper;

public class ArtistModel
{
    private static final String COLLECTION_NAME = "artists";

    public static void FromKey(String key, ArtistValueEventListener valueEventListener)
    {
        FIRQueryHelper.FromKey(COLLECTION_NAME, key, valueEventListener);
    }

    private String bio;
    private String country;
    private String firstName;
    private String lastName;

    public String getFirstName()
    {
        return firstName;
    }

    public String getLastName()
    {
        return lastName;
    }

    public String getBio()
    {
        return bio;
    }

    public String getCountry()
    {
        return country;
    }
}
