package com.swiftsoft.anixartd.p015ui.controller.main.profile.lists;

import com.airbnb.epoxy.EpoxyModel;
import com.swiftsoft.anixartd.C2507R;
import com.swiftsoft.anixartd.database.entity.Release;
import com.swiftsoft.anixartd.database.entity.ReleaseStatus;
import com.swiftsoft.anixartd.epoxy.Typed8EpoxyController;
import com.swiftsoft.anixartd.p015ui.model.common.EmptyModel_;
import com.swiftsoft.anixartd.p015ui.model.common.LoadingModel_;
import com.swiftsoft.anixartd.p015ui.model.common.ReleaseCardModel_;
import com.swiftsoft.anixartd.p015ui.model.common.ReleaseModel;
import com.swiftsoft.anixartd.p015ui.model.common.ReleaseModel_;
import com.swiftsoft.anixartd.p015ui.model.main.bookmarks.ExtraBookmarksModel;
import com.swiftsoft.anixartd.p015ui.model.main.bookmarks.ExtraBookmarksModel_;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import p029i.C6284a;

/* compiled from: ProfileListsTabUiController.kt */
@Metadata(m31883d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010\t\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u000b\u0018\u000028\u0012\u0004\u0012\u00020\u0002\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\b0\u0001:\u0001\u0015B\u0005¢\u0006\u0002\u0010\tJN\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u00022\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u0006\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u00072\u0006\u0010\u0013\u001a\u00020\bH\u0014J\u0006\u0010\u0014\u001a\u00020\u0007¨\u0006\u0016"}, m31884d2 = {"Lcom/swiftsoft/anixartd/ui/controller/main/profile/lists/ProfileListsTabUiController;", "Lcom/swiftsoft/anixartd/epoxy/Typed8EpoxyController;", "", "", "Lcom/swiftsoft/anixartd/database/entity/Release;", "", "", "", "Lcom/swiftsoft/anixartd/ui/controller/main/profile/lists/ProfileListsTabUiController$Listener;", "()V", "buildModels", "", "viewType", "releases", "selectedInnerTab", "totalCount", "selectedSort", "isSortEnabled", "isLoadable", "listener", "isEmpty", "Listener", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1}, m31888xi = 48)
/* loaded from: classes2.dex */
public final class ProfileListsTabUiController extends Typed8EpoxyController<Integer, List<? extends Release>, String, Long, Integer, Boolean, Boolean, Listener> {

    /* compiled from: ProfileListsTabUiController.kt */
    @Metadata(m31883d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, m31884d2 = {"Lcom/swiftsoft/anixartd/ui/controller/main/profile/lists/ProfileListsTabUiController$Listener;", "Lcom/swiftsoft/anixartd/ui/model/common/ReleaseModel$Listener;", "Lcom/swiftsoft/anixartd/ui/model/main/bookmarks/ExtraBookmarksModel$Listener;", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1}, m31888xi = 48)
    public interface Listener extends ReleaseModel.Listener, ExtraBookmarksModel.Listener {
    }

    public ProfileListsTabUiController() {
        setDebugLoggingEnabled(true);
        setFilterDuplicates(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int buildModels$lambda$1$lambda$0(int i2, int i3, int i4) {
        return i2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int buildModels$lambda$3$lambda$2(int i2, int i3, int i4) {
        return i2;
    }

    @Override // com.swiftsoft.anixartd.epoxy.Typed8EpoxyController
    public /* bridge */ /* synthetic */ void buildModels(Integer num, List<? extends Release> list, String str, Long l2, Integer num2, Boolean bool, Boolean bool2, Listener listener) {
        buildModels(num.intValue(), (List<Release>) list, str, l2.longValue(), num2.intValue(), bool.booleanValue(), bool2.booleanValue(), listener);
    }

    public final boolean isEmpty() {
        return getAdapter().f6911j == 0;
    }

    public void buildModels(int viewType, @NotNull List<Release> releases, @NotNull String selectedInnerTab, long totalCount, int selectedSort, boolean isSortEnabled, boolean isLoadable, @NotNull Listener listener) {
        Intrinsics.m32179h(releases, "releases");
        Intrinsics.m32179h(selectedInnerTab, "selectedInnerTab");
        Intrinsics.m32179h(listener, "listener");
        if (releases.isEmpty()) {
            EmptyModel_ emptyModel_ = new EmptyModel_();
            emptyModel_.m4520h2("empty");
            emptyModel_.m4524l2();
            emptyModel_.f29382k = C2507R.string.empty_profile_list;
            emptyModel_.f6932i = C6284a.f58045y;
            add(emptyModel_);
            return;
        }
        if (isSortEnabled) {
            ExtraBookmarksModel_ extraBookmarksModel_ = new ExtraBookmarksModel_();
            extraBookmarksModel_.m4520h2("extraBookmarks");
            extraBookmarksModel_.m4524l2();
            extraBookmarksModel_.f29465l = totalCount;
            extraBookmarksModel_.m4524l2();
            extraBookmarksModel_.f29466m = selectedSort;
            extraBookmarksModel_.m4524l2();
            extraBookmarksModel_.f29464k = listener;
            extraBookmarksModel_.f6932i = C6284a.f58046z;
            add(extraBookmarksModel_);
        }
        if (viewType == 1) {
            for (Release release : releases) {
                ReleaseCardModel_ releaseCardModel_ = new ReleaseCardModel_();
                releaseCardModel_.mo15739b(release.getId());
                String titleRu = release.getTitleRu();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29387k = titleRu;
                Integer episodesReleased = release.getEpisodesReleased();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29388l = episodesReleased;
                Integer episodesTotal = release.getEpisodesTotal();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29389m = episodesTotal;
                Double valueOf = Double.valueOf(release.getGrade());
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29390n = valueOf;
                String description = release.getDescription();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29391o = description;
                String image = release.getImage();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29392p = image;
                String year = release.getYear();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29393q = year;
                int season = release.getSeason();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29394r = season;
                ReleaseStatus status = release.getStatus();
                Long valueOf2 = status != null ? Long.valueOf(status.getId()) : null;
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29396t = valueOf2;
                long airedOnDate = release.getAiredOnDate();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29395s = airedOnDate;
                boolean isFavorite = release.getIsFavorite();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29397u = isFavorite;
                int profileListStatus = release.getProfileListStatus();
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29398v = profileListStatus;
                boolean z = release.getVoteCount() > 50;
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29399w = z;
                releaseCardModel_.m4524l2();
                releaseCardModel_.f29400x = listener;
                add(releaseCardModel_);
            }
        } else {
            for (Release release2 : releases) {
                ReleaseModel_ releaseModel_ = new ReleaseModel_();
                releaseModel_.mo15761b(release2.getId());
                String titleRu2 = release2.getTitleRu();
                releaseModel_.m4524l2();
                releaseModel_.f29416k = titleRu2;
                Integer episodesReleased2 = release2.getEpisodesReleased();
                releaseModel_.m4524l2();
                releaseModel_.f29417l = episodesReleased2;
                Integer episodesTotal2 = release2.getEpisodesTotal();
                releaseModel_.m4524l2();
                releaseModel_.f29418m = episodesTotal2;
                Double valueOf3 = Double.valueOf(release2.getGrade());
                releaseModel_.m4524l2();
                releaseModel_.f29419n = valueOf3;
                String description2 = release2.getDescription();
                releaseModel_.m4524l2();
                releaseModel_.f29420o = description2;
                String image2 = release2.getImage();
                releaseModel_.m4524l2();
                releaseModel_.f29421p = image2;
                String year2 = release2.getYear();
                releaseModel_.m4524l2();
                releaseModel_.f29422q = year2;
                int season2 = release2.getSeason();
                releaseModel_.m4524l2();
                releaseModel_.f29423r = season2;
                ReleaseStatus status2 = release2.getStatus();
                Long valueOf4 = status2 != null ? Long.valueOf(status2.getId()) : null;
                releaseModel_.m4524l2();
                releaseModel_.f29425t = valueOf4;
                long airedOnDate2 = release2.getAiredOnDate();
                releaseModel_.m4524l2();
                releaseModel_.f29424s = airedOnDate2;
                boolean isFavorite2 = release2.getIsFavorite();
                releaseModel_.m4524l2();
                releaseModel_.f29426u = isFavorite2;
                int profileListStatus2 = release2.getProfileListStatus();
                releaseModel_.m4524l2();
                releaseModel_.f29427v = profileListStatus2;
                boolean z2 = release2.getVoteCount() > 50;
                releaseModel_.m4524l2();
                releaseModel_.f29428w = z2;
                releaseModel_.m4524l2();
                releaseModel_.f29429x = listener;
                add(releaseModel_);
            }
        }
        if (isLoadable) {
            EpoxyModel<?> loadingModel_ = new LoadingModel_();
            loadingModel_.m4520h2("loading");
            add(loadingModel_);
        }
    }
}
