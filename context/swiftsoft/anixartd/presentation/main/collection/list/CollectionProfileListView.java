package com.swiftsoft.anixartd.presentation.main.collection.list;

import com.swiftsoft.anixartd.database.entity.Collection;
import kotlin.Metadata;
import moxy.MvpView;
import moxy.viewstate.strategy.AddToEndSingleTagStrategy;
import moxy.viewstate.strategy.OneExecutionStateStrategy;
import moxy.viewstate.strategy.StateStrategyType;
import org.jetbrains.annotations.NotNull;

/* compiled from: CollectionProfileListView.kt */
@StateStrategyType(AddToEndSingleTagStrategy.class)
@Metadata(m31882bv = {}, m31883d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bg\u0018\u00002\u00020\u0001¨\u0006\u0002"}, m31884d2 = {"Lcom/swiftsoft/anixartd/presentation/main/collection/list/CollectionProfileListView;", "Lmoxy/MvpView;", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1})
/* loaded from: classes2.dex */
public interface CollectionProfileListView extends MvpView {
    @StateStrategyType(OneExecutionStateStrategy.class)
    /* renamed from: M */
    void mo14534M();

    /* renamed from: a */
    void mo14535a();

    /* renamed from: b */
    void mo14536b();

    @StateStrategyType(OneExecutionStateStrategy.class)
    /* renamed from: c */
    void mo14537c();

    /* renamed from: d */
    void mo14538d();

    /* renamed from: e */
    void mo14539e();

    /* renamed from: l */
    void mo14540l();

    @StateStrategyType(OneExecutionStateStrategy.class)
    /* renamed from: v */
    void mo14541v(@NotNull Collection collection);
}
