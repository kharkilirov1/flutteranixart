package com.swiftsoft.anixartd.p015ui.fragment.main.episodes.updates;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import androidx.core.view.inputmethod.C0273a;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import com.airbnb.epoxy.EpoxyRecyclerView;
import com.google.android.material.button.MaterialButton;
import com.google.firebase.auth.C2052a;
import com.swiftsoft.anixartd.App;
import com.swiftsoft.anixartd.C2507R;
import com.swiftsoft.anixartd.p015ui.EndlessRecyclerViewScrollListener;
import com.swiftsoft.anixartd.p015ui.activity.ViewOnClickListenerC2625a;
import com.swiftsoft.anixartd.p015ui.fragment.BaseFragment;
import com.swiftsoft.anixartd.p015ui.fragment.main.episodes.updates.EpisodesUpdatesFragment;
import com.swiftsoft.anixartd.p015ui.logic.main.episodes.updates.EpisodesUpdatesUiLogic;
import com.swiftsoft.anixartd.presentation.main.episodes.updates.EpisodesUpdatesPresenter;
import com.swiftsoft.anixartd.presentation.main.episodes.updates.EpisodesUpdatesView;
import com.swiftsoft.anixartd.utils.EventBusKt;
import com.swiftsoft.anixartd.utils.OnBottomNavigation;
import com.swiftsoft.anixartd.utils.ViewsKt;
import dagger.Lazy;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.inject.Inject;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import moxy.MvpDelegate;
import moxy.ktx.MoxyKtxDelegate;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* compiled from: EpisodesUpdatesFragment.kt */
@Metadata(m31882bv = {}, m31883d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0005B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, m31884d2 = {"Lcom/swiftsoft/anixartd/ui/fragment/main/episodes/updates/EpisodesUpdatesFragment;", "Lcom/swiftsoft/anixartd/ui/fragment/BaseFragment;", "Lcom/swiftsoft/anixartd/presentation/main/episodes/updates/EpisodesUpdatesView;", "<init>", "()V", "Companion", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1})
/* loaded from: classes2.dex */
public final class EpisodesUpdatesFragment extends BaseFragment implements EpisodesUpdatesView {

    /* renamed from: d */
    public EndlessRecyclerViewScrollListener f28140d;

    /* renamed from: e */
    @Inject
    public Lazy<EpisodesUpdatesPresenter> f28141e;

    /* renamed from: f */
    @NotNull
    public final MoxyKtxDelegate f28142f;

    /* renamed from: g */
    public long f28143g;

    /* renamed from: h */
    @NotNull
    public Map<Integer, View> f28144h = new LinkedHashMap();

    /* renamed from: j */
    public static final /* synthetic */ KProperty<Object>[] f28139j = {C2052a.m12277l(EpisodesUpdatesFragment.class, "presenter", "getPresenter()Lcom/swiftsoft/anixartd/presentation/main/episodes/updates/EpisodesUpdatesPresenter;", 0)};

    /* renamed from: i */
    @NotNull
    public static final Companion f28138i = new Companion(null);

    /* compiled from: EpisodesUpdatesFragment.kt */
    @Metadata(m31882bv = {}, m31883d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, m31884d2 = {"Lcom/swiftsoft/anixartd/ui/fragment/main/episodes/updates/EpisodesUpdatesFragment$Companion;", "", "", "ID_VALUE", "Ljava/lang/String;", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1})
    public static final class Companion {
        public Companion() {
        }

        public Companion(DefaultConstructorMarker defaultConstructorMarker) {
        }
    }

    public EpisodesUpdatesFragment() {
        Function0<EpisodesUpdatesPresenter> function0 = new Function0<EpisodesUpdatesPresenter>() { // from class: com.swiftsoft.anixartd.ui.fragment.main.episodes.updates.EpisodesUpdatesFragment$presenter$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public EpisodesUpdatesPresenter invoke() {
                Lazy<EpisodesUpdatesPresenter> lazy = EpisodesUpdatesFragment.this.f28141e;
                if (lazy != null) {
                    return lazy.get();
                }
                Intrinsics.m32189r("presenterProvider");
                throw null;
            }
        };
        MvpDelegate mvpDelegate = getMvpDelegate();
        this.f28142f = new MoxyKtxDelegate(mvpDelegate, C2052a.m12274i(EpisodesUpdatesPresenter.class, C2052a.m12275j(mvpDelegate, "mvpDelegate"), ".", "presenter"), function0);
    }

    @Nullable
    /* renamed from: A3 */
    public View m15507A3(int i2) {
        View findViewById;
        Map<Integer, View> map = this.f28144h;
        View view = map.get(Integer.valueOf(i2));
        if (view != null) {
            return view;
        }
        View view2 = getView();
        if (view2 == null || (findViewById = view2.findViewById(i2)) == null) {
            return null;
        }
        map.put(Integer.valueOf(i2), findViewById);
        return findViewById;
    }

    @Override // com.swiftsoft.anixartd.presentation.main.episodes.updates.EpisodesUpdatesView
    /* renamed from: a */
    public void mo14633a() {
        ProgressBar progress_bar = (ProgressBar) m15507A3(C2507R.id.progress_bar);
        Intrinsics.m32178g(progress_bar, "progress_bar");
        ViewsKt.m16372e(progress_bar);
    }

    @Override // com.swiftsoft.anixartd.presentation.main.episodes.updates.EpisodesUpdatesView
    /* renamed from: b */
    public void mo14634b() {
        ProgressBar progress_bar = (ProgressBar) m15507A3(C2507R.id.progress_bar);
        Intrinsics.m32178g(progress_bar, "progress_bar");
        ViewsKt.m16378k(progress_bar);
    }

    @Override // com.swiftsoft.anixartd.presentation.main.episodes.updates.EpisodesUpdatesView
    /* renamed from: c */
    public void mo14635c() {
        ((SwipeRefreshLayout) m15507A3(C2507R.id.refresh)).setEnabled(false);
        EpoxyRecyclerView recycler_view = (EpoxyRecyclerView) m15507A3(C2507R.id.recycler_view);
        Intrinsics.m32178g(recycler_view, "recycler_view");
        ViewsKt.m16372e(recycler_view);
        LinearLayout error_layout = (LinearLayout) m15507A3(C2507R.id.error_layout);
        Intrinsics.m32178g(error_layout, "error_layout");
        ViewsKt.m16378k(error_layout);
    }

    /* renamed from: c4 */
    public final EpisodesUpdatesPresenter m15508c4() {
        return (EpisodesUpdatesPresenter) this.f28142f.getValue(this, f28139j[0]);
    }

    @Override // com.swiftsoft.anixartd.presentation.main.episodes.updates.EpisodesUpdatesView
    /* renamed from: d */
    public void mo14636d() {
        ((SwipeRefreshLayout) m15507A3(C2507R.id.refresh)).setRefreshing(true);
    }

    @Override // com.swiftsoft.anixartd.presentation.main.episodes.updates.EpisodesUpdatesView
    /* renamed from: e */
    public void mo14637e() {
        ((SwipeRefreshLayout) m15507A3(C2507R.id.refresh)).setRefreshing(false);
    }

    @Override // com.swiftsoft.anixartd.p015ui.fragment.BaseFragment
    /* renamed from: n3 */
    public void mo15436n3() {
        this.f28144h.clear();
    }

    @Override // moxy.MvpAppCompatFragment, androidx.fragment.app.Fragment
    public void onCreate(@Nullable Bundle bundle) {
        App.f25340b.m14043a().mo14134l0(this);
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.f28143g = arguments.getLong("ID_VALUE");
        }
        EventBusKt.m16327a(new OnBottomNavigation(false));
        EpisodesUpdatesPresenter m15508c4 = m15508c4();
        long j2 = this.f28143g;
        EpisodesUpdatesUiLogic episodesUpdatesUiLogic = m15508c4.f26369b;
        episodesUpdatesUiLogic.f29071b = j2;
        episodesUpdatesUiLogic.f28956a = true;
        EpisodesUpdatesPresenter presenter = m15508c4();
        Intrinsics.m32178g(presenter, "presenter");
        presenter.m14632a(presenter.f26370c.isEmpty(), false);
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NotNull LayoutInflater inflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        Intrinsics.m32179h(inflater, "inflater");
        View inflate = inflater.inflate(C2507R.layout.fragment_episodes_updates, viewGroup, false);
        ((RelativeLayout) inflate.findViewById(C2507R.id.back)).setOnClickListener(new ViewOnClickListenerC2625a(this, 13));
        EpoxyRecyclerView epoxyRecyclerView = (EpoxyRecyclerView) inflate.findViewById(C2507R.id.recycler_view);
        final RecyclerView.LayoutManager layoutManager = epoxyRecyclerView.getLayoutManager();
        EndlessRecyclerViewScrollListener endlessRecyclerViewScrollListener = new EndlessRecyclerViewScrollListener(layoutManager) { // from class: com.swiftsoft.anixartd.ui.fragment.main.episodes.updates.EpisodesUpdatesFragment$onCreateView$2$1
            @Override // com.swiftsoft.anixartd.p015ui.EndlessRecyclerViewScrollListener
            /* renamed from: e */
            public void mo15318e(int i2, int i3, @Nullable RecyclerView recyclerView) {
                EpisodesUpdatesFragment episodesUpdatesFragment = EpisodesUpdatesFragment.this;
                EpisodesUpdatesFragment.Companion companion = EpisodesUpdatesFragment.f28138i;
                EpisodesUpdatesPresenter m15508c4 = episodesUpdatesFragment.m15508c4();
                m15508c4.f26369b.f29072c++;
                m15508c4.m14632a(m15508c4.f26370c.isEmpty(), false);
            }
        };
        this.f28140d = endlessRecyclerViewScrollListener;
        epoxyRecyclerView.m3806m(endlessRecyclerViewScrollListener);
        epoxyRecyclerView.setController(m15508c4().f26370c);
        SwipeRefreshLayout swipeRefreshLayout = (SwipeRefreshLayout) inflate.findViewById(C2507R.id.refresh);
        swipeRefreshLayout.setColorSchemeResources(C2507R.color.refresh_progress);
        swipeRefreshLayout.setProgressBackgroundColorSchemeResource(C2507R.color.refresh_background);
        swipeRefreshLayout.setOnRefreshListener(new C0273a(this, 18));
        MaterialButton materialButton = (MaterialButton) inflate.findViewById(C2507R.id.help);
        Intrinsics.m32178g(materialButton, "view.help");
        ViewsKt.m16377j(materialButton, new Function1<View, Unit>() { // from class: com.swiftsoft.anixartd.ui.fragment.main.episodes.updates.EpisodesUpdatesFragment$onCreateView$4
            @Override // kotlin.jvm.functions.Function1
            public Unit invoke(View view) {
                C2052a.m12281p(view, "it");
                return Unit.f63088a;
            }
        });
        MaterialButton materialButton2 = (MaterialButton) inflate.findViewById(C2507R.id.repeat);
        Intrinsics.m32178g(materialButton2, "view.repeat");
        ViewsKt.m16377j(materialButton2, new Function1<View, Unit>() { // from class: com.swiftsoft.anixartd.ui.fragment.main.episodes.updates.EpisodesUpdatesFragment$onCreateView$5
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public Unit invoke(View view) {
                View it = view;
                Intrinsics.m32179h(it, "it");
                ((SwipeRefreshLayout) EpisodesUpdatesFragment.this.m15507A3(C2507R.id.refresh)).setEnabled(true);
                LinearLayout error_layout = (LinearLayout) EpisodesUpdatesFragment.this.m15507A3(C2507R.id.error_layout);
                Intrinsics.m32178g(error_layout, "error_layout");
                ViewsKt.m16372e(error_layout);
                EpisodesUpdatesFragment.this.m15509u();
                return Unit.f63088a;
            }
        });
        return inflate;
    }

    @Override // com.swiftsoft.anixartd.p015ui.fragment.BaseFragment, moxy.MvpAppCompatFragment, androidx.fragment.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.f28144h.clear();
    }

    @Override // com.swiftsoft.anixartd.p015ui.fragment.BaseFragment, androidx.fragment.app.Fragment
    public void onHiddenChanged(boolean z) {
        EventBusKt.m16327a(new OnBottomNavigation(false));
    }

    /* renamed from: u */
    public final void m15509u() {
        EpoxyRecyclerView recycler_view = (EpoxyRecyclerView) m15507A3(C2507R.id.recycler_view);
        Intrinsics.m32178g(recycler_view, "recycler_view");
        ViewsKt.m16378k(recycler_view);
        ((EpoxyRecyclerView) m15507A3(C2507R.id.recycler_view)).m3826w0(0);
        EndlessRecyclerViewScrollListener endlessRecyclerViewScrollListener = this.f28140d;
        if (endlessRecyclerViewScrollListener == null) {
            Intrinsics.m32189r("endlessRecyclerViewScrollListener");
            throw null;
        }
        endlessRecyclerViewScrollListener.m15320g();
        EpisodesUpdatesPresenter m15508c4 = m15508c4();
        EpisodesUpdatesUiLogic episodesUpdatesUiLogic = m15508c4.f26369b;
        if (episodesUpdatesUiLogic.f28956a) {
            episodesUpdatesUiLogic.f29072c = 0;
            episodesUpdatesUiLogic.f29074e = 0L;
            episodesUpdatesUiLogic.f29073d.clear();
            m15508c4.m14632a(false, true);
        }
    }
}
