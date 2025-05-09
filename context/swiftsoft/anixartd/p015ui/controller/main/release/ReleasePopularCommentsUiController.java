package com.swiftsoft.anixartd.p015ui.controller.main.release;

import com.airbnb.epoxy.Typed2EpoxyController;
import com.swiftsoft.anixartd.database.entity.ReleaseComment;
import com.swiftsoft.anixartd.p015ui.model.main.comments.CommentModel;
import com.swiftsoft.anixartd.p015ui.model.main.comments.CommentModel_;
import com.swiftsoft.anixartd.p015ui.model.main.comments.NoCommentsModel_;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* compiled from: ReleasePopularCommentsUiController.kt */
@Metadata(m31883d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\u0018\u00002\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\u0002\u0012\u0004\u0012\u00020\u00040\u0001:\u0001\fB\u0005¢\u0006\u0002\u0010\u0005J\u001e\u0010\u0006\u001a\u00020\u00072\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\u00022\u0006\u0010\t\u001a\u00020\u0004H\u0014J\u0006\u0010\n\u001a\u00020\u000b¨\u0006\r"}, m31884d2 = {"Lcom/swiftsoft/anixartd/ui/controller/main/release/ReleasePopularCommentsUiController;", "Lcom/airbnb/epoxy/Typed2EpoxyController;", "", "Lcom/swiftsoft/anixartd/database/entity/ReleaseComment;", "Lcom/swiftsoft/anixartd/ui/controller/main/release/ReleasePopularCommentsUiController$Listener;", "()V", "buildModels", "", "releaseComments", "listener", "isEmpty", "", "Listener", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1}, m31888xi = 48)
/* loaded from: classes2.dex */
public final class ReleasePopularCommentsUiController extends Typed2EpoxyController<List<? extends ReleaseComment>, Listener> {

    /* compiled from: ReleasePopularCommentsUiController.kt */
    @Metadata(m31883d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001¨\u0006\u0002"}, m31884d2 = {"Lcom/swiftsoft/anixartd/ui/controller/main/release/ReleasePopularCommentsUiController$Listener;", "Lcom/swiftsoft/anixartd/ui/model/main/comments/CommentModel$Listener;", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1}, m31888xi = 48)
    public interface Listener extends CommentModel.Listener {
    }

    public ReleasePopularCommentsUiController() {
        setDebugLoggingEnabled(true);
        setFilterDuplicates(true);
    }

    @Override // com.airbnb.epoxy.Typed2EpoxyController
    public /* bridge */ /* synthetic */ void buildModels(List<? extends ReleaseComment> list, Listener listener) {
        buildModels2((List<ReleaseComment>) list, listener);
    }

    public final boolean isEmpty() {
        return getAdapter().f6911j == 0;
    }

    /* renamed from: buildModels, reason: avoid collision after fix types in other method */
    public void buildModels2(@NotNull List<ReleaseComment> releaseComments, @NotNull Listener listener) {
        Intrinsics.m32179h(releaseComments, "releaseComments");
        Intrinsics.m32179h(listener, "listener");
        if (!(!releaseComments.isEmpty())) {
            NoCommentsModel_ noCommentsModel_ = new NoCommentsModel_();
            noCommentsModel_.mo15907a("no_comments");
            add(noCommentsModel_);
            return;
        }
        for (ReleaseComment releaseComment : releaseComments) {
            CommentModel_ commentModel_ = new CommentModel_();
            commentModel_.mo15872b(releaseComment.getId());
            commentModel_.mo15868B(releaseComment.getProfile().getId());
            commentModel_.mo15880v(releaseComment.getMessage());
            commentModel_.mo15879u(releaseComment.getIsSpoiler());
            commentModel_.mo15882x(releaseComment.getVoteCount());
            commentModel_.mo15870S(releaseComment.getVote());
            commentModel_.mo15878t(releaseComment.getTimestamp());
            commentModel_.mo15881w(releaseComment.getIsEdited());
            commentModel_.mo15869E(releaseComment.getIsDeleted());
            commentModel_.mo15871Z0(releaseComment.getReplyCount());
            commentModel_.mo15875l(releaseComment.getProfile().getAvatar());
            commentModel_.mo15874k(releaseComment.getProfile().getLogin());
            commentModel_.mo15877r(releaseComment.getProfile().getIsSponsor());
            commentModel_.mo15876p(releaseComment.getProfile().getIsVerified());
            commentModel_.mo15873b1(listener);
            add(commentModel_);
        }
    }
}
