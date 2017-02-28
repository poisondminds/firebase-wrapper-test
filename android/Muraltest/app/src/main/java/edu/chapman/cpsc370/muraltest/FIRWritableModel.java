package edu.chapman.cpsc370.muraltest;

import com.google.firebase.database.FirebaseDatabase;

public abstract class FIRWritableModel extends FIRModel
{
    protected abstract String getCollectionName();

    public void saveChanges()
    {
        if (this.key == null)
        {
            throw new RuntimeException("Key cannot be null when updating FIRModel");
        }

        FirebaseDatabase.getInstance()
                .getReference(getCollectionName())
                .child(this.getKey())
                .setValue(this);
    }

    public void create()
    {
        if (this.key != null)
        {
            throw new RuntimeException("Cannot create a FIRModel that already has a key!");
        }

        this.key = FirebaseDatabase.getInstance().getReference(getCollectionName()).push().getKey();
        saveChanges();
    }
}
