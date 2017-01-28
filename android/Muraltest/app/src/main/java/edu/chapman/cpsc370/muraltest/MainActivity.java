package edu.chapman.cpsc370.muraltest;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.firebase.database.DatabaseError;
import com.squareup.picasso.Picasso;

import java.util.List;

import edu.chapman.cpsc370.muraltest.models.ArtistModel;
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

        MuralModel.All(new MuralValueEventListener()
        {
            @Override
            void onDataChange(List<MuralModel> models)
            {
                MuralModel mural = models.get(0);

                titleTextView.setText(mural.getName());
                descTextView.setText(mural.getDescription());

                List<String> artistKeys = mural.getArtists();

                displayArtist(artistKeys.get(0));

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

    private void displayArtist(String key)
    {
        ArtistModel.FromKey(key, new ArtistValueEventListener()
        {
            @Override
            public void onDataChange(List<ArtistModel> artists)
            {
                ArtistModel artist = artists.get(0);
                artistTextView.setText(artist.getFirstName());
            }

            @Override
            public void onCancelled(DatabaseError databaseError)
            {
                Log.e("test", "artist error: " + databaseError.getMessage());
            }
        });
    }
}
