package com.swiftsoft.anixartd.utils;

import com.yandex.div2.C3033a;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* compiled from: Hashes.kt */
@Metadata(m31883d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u0005\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n¢\u0006\u0002\b\u0004"}, m31884d2 = {"<anonymous>", "", "it", "", "invoke"}, m31885k = 3, m31886mv = {1, 7, 1}, m31888xi = 48)
/* loaded from: classes2.dex */
final class Hashes$md5$1 extends Lambda implements Function1<Byte, CharSequence> {
    static {
        new Hashes$md5$1();
    }

    public Hashes$md5$1() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public CharSequence invoke(Byte b) {
        return C3033a.m17745g(new Object[]{Byte.valueOf(b.byteValue())}, 1, "%02x", "format(format, *args)");
    }
}
