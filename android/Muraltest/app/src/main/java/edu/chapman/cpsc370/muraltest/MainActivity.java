package edu.chapman.cpsc370.muraltest;

import android.media.Image;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.squareup.picasso.Picasso;

import java.util.HashMap;
import java.util.List;

import edu.chapman.cpsc370.muraltest.models.ImageModel;
import edu.chapman.cpsc370.muraltest.models.MuralModel;

public class MainActivity extends AppCompatActivity
{

    private ImageView imageView;
    private TextView artistTextView;
    private TextView titleTextView;
    private TextView descTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        this.imageView = (ImageView) findViewById(R.id.iv);
        this.artistTextView = (TextView) findViewById(R.id.tv_artist);
        this.titleTextView = (TextView) findViewById(R.id.tv_title);
        this.descTextView = (TextView) findViewById(R.id.tv_desc);

        FirebaseDatabase db = FirebaseDatabase.getInstance();
        DatabaseReference ref = db.getReference("murals");
        ref.addValueEventListener(new ValueEventListener()
        {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot)
            {
                DataSnapshot firstChildMural = dataSnapshot.getChildren().iterator().next();

                MuralModel mural = firstChildMural.getValue(MuralModel.class);
                titleTextView.setText(mural.getName());
                descTextView.setText(mural.getDescription());

                //List<String> artistKeys = mural.getArtistKeys();

                ImageModel firstImage = mural.getImages().get(0);

                Picasso.with(MainActivity.this).load(firstImage.getUrl()).into(imageView);
            }

            @Override
            public void onCancelled(DatabaseError databaseError)
            {
                Log.e("test", "error: " + databaseError.getMessage());
            }
        });
    }
}
