package fytsyk.com.vipersample.chapters.ui

import android.view.View
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import fytsyk.com.vipersample.R

class ChapterViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
    val titleView: TextView by lazy {
        itemView.findViewById<TextView>(R.id.item_title)
    }
    val descriptionView: TextView by lazy {
        itemView.findViewById<TextView>(R.id.item_description)
    }
    val imageView: ImageView by lazy {
        itemView.findViewById<ImageView>(R.id.item_image)
    }
}