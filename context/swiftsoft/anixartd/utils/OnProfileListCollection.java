package com.swiftsoft.anixartd.utils;

import com.swiftsoft.anixartd.database.entity.Collection;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* compiled from: EventBus.kt */
@Metadata(m31882bv = {}, m31883d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, m31884d2 = {"Lcom/swiftsoft/anixartd/utils/OnProfileListCollection;", "Lcom/swiftsoft/anixartd/utils/OnEventIdentifiable;", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1})
/* loaded from: classes2.dex */
public final class OnProfileListCollection extends OnEventIdentifiable {

    /* renamed from: b */
    @NotNull
    public final Collection f30215b;

    public OnProfileListCollection(@Nullable String str, @NotNull Collection collection) {
        super(str);
        this.f30215b = collection;
    }
}
