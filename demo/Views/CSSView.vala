/*
 * Copyright 2017–2021 elementary, Inc. (https://elementary.io)
 * SPDX-License-Identifier: LGPL-3.0-or-later
 */

public class CSSView : Gtk.Grid {
    public Gtk.Window window { get; construct; }

    public CSSView (Gtk.Window window) {
        Object (
            halign: Gtk.Align.CENTER,
            margin_top: 24,
            margin_bottom: 24,
            margin_start: 24,
            margin_end: 24,
            valign: Gtk.Align.CENTER,
            window: window
        );
    }

    construct {
        var header1 = new Gtk.Label ("\"h1\" Style Class") {
            margin_end = 24,
            margin_start = 24,
            margin_top = 12
        };
        header1.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);

        var header2 = new Gtk.Label ("\"h2\" Style Class");
        header2.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);

        var header3 = new Gtk.Label ("\"h3\" Style Class");
        header3.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);

        var header4 = new Gtk.Label ("\"h4\" Style Class") {
            margin_bottom = 12
        };
        header4.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        var card_label = new Gtk.Label ("\"card\" with \"rounded\" style class:") {
            halign = Gtk.Align.END
        };

        var card = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);

        unowned Gtk.StyleContext card_context = card.get_style_context ();
        card_context.add_class (Granite.STYLE_CLASS_CARD);
        card_context.add_class (Granite.STYLE_CLASS_ROUNDED);

        card.append (header1);
        card.append (header2);
        card.append (header3);
        card.append (header4);

        var checker_label = new Gtk.Label ("\"checkerboard\" style class:") {
            halign = Gtk.Align.END
        };

        var checker_image = new Gtk.Image.from_icon_name ("dialog-information") {
            hexpand = true,
            margin_start = 6,
            margin_end = 6,
            margin_top = 6,
            margin_bottom = 6
        };

        var checker_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        checker_box.get_style_context ().add_class (Granite.STYLE_CLASS_CHECKERBOARD);
        checker_box.append (checker_image);

        var terminal_label = new Gtk.Label ("\"terminal\" style class:") {
            halign = Gtk.Align.END
        };

        var terminal = new Gtk.Label ("[ 73%] Linking C executable granite-demo\n[100%] Built target granite-demo") {
            selectable = true,
            wrap = true,
            xalign = 0,
            yalign = 0
        };

        var terminal_scroll = new Gtk.ScrolledWindow () {
            min_content_height = 70,
            child = terminal
        };
        terminal_scroll.add_css_class (Granite.STYLE_CLASS_TERMINAL);

        var back_button_label = new Gtk.Label ("\"back-button\" style class:") {
            halign = Gtk.Align.END
        };

        var back_button = new Gtk.Button.with_label ("Back Button") {
            halign = Gtk.Align.START
        };
        back_button.get_style_context ().add_class (Granite.STYLE_CLASS_BACK_BUTTON);

        var warmth_label = new Gtk.Label ("\"warmth\" style class:") {
            halign = Gtk.Align.END
        };

        var warmth_scale = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 3500, 6000, 10) {
            draw_value = false,
            has_origin = false,
            hexpand = true,
            inverted = true
        };
        warmth_scale.set_value (6000);
        warmth_scale.get_style_context ().add_class (Granite.STYLE_CLASS_WARMTH);

        var temperature_label = new Gtk.Label ("\"temperature\" style class:") {
            halign = Gtk.Align.END
        };

        var temperature_scale = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, -16.0f, 16.0f, 1.0) {
            draw_value = false,
            has_origin = false,
            hexpand = true
        };
        temperature_scale.set_value (0);
        temperature_scale.get_style_context ().add_class (Granite.STYLE_CLASS_TEMPERATURE);

        var primary_color_label = new Gtk.Label ("Set HeaderBar color:") {
            halign = Gtk.Align.END
        };

        var primary_color_button = new Gtk.ColorButton.with_rgba ({ 222, 222, 222, 255 });

        var accent_color_label = new Gtk.Label ("Accent colored labels and icons:") {
            halign = Gtk.Align.END
        };

        var accent_color_icon = new Gtk.Image.from_icon_name ("emoji-body-symbolic");
        accent_color_icon.get_style_context ().add_class (Granite.STYLE_CLASS_ACCENT);

        var accent_color_string = new Gtk.Label ("Lorem ipsum dolor sit amet");
        accent_color_string.get_style_context ().add_class (Granite.STYLE_CLASS_ACCENT);

        var accent_color_grid = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 6);
        accent_color_grid.append (accent_color_icon);
        accent_color_grid.append (accent_color_string);

        column_spacing = 12;
        row_spacing = 24;

        attach (card_label, 0, 0);
        attach (card, 1, 0, 2);
        attach (checker_label, 0, 1);
        attach (checker_box, 1, 1, 2);
        attach (terminal_label, 0, 2);
        attach (terminal_scroll, 1, 2, 2);
        attach (back_button_label, 0, 3);
        attach (back_button, 1, 3, 2);
        attach (warmth_label, 0, 4);
        attach (warmth_scale, 1, 4);
        attach (temperature_label, 0, 5);
        attach (temperature_scale, 1, 5);
        attach (primary_color_label, 0, 6);
        attach (primary_color_button, 1, 6, 2);
        attach (accent_color_label, 0, 7);
        attach (accent_color_grid, 1, 7);

        primary_color_button.color_set.connect (() => {
            Granite.Widgets.Utils.set_color_primary (window, primary_color_button.rgba);
        });
    }
}
