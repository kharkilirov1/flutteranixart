package com.swiftsoft.anixartd.network.response.preferences;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.swiftsoft.anixartd.database.entity.ProfileReleaseTypeNotificationPreference;
import com.swiftsoft.anixartd.network.Response;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* compiled from: ProfileReleaseTypeNotificationPreferencesResponse.kt */
@Metadata(m31883d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002R\"\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048GX\u0086.¢\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\t¨\u0006\n"}, m31884d2 = {"Lcom/swiftsoft/anixartd/network/response/preferences/ProfileReleaseTypeNotificationPreferencesResponse;", "Lcom/swiftsoft/anixartd/network/Response;", "()V", "profileReleaseTypeNotificationPreferences", "", "Lcom/swiftsoft/anixartd/database/entity/ProfileReleaseTypeNotificationPreference;", "getProfileReleaseTypeNotificationPreferences", "()Ljava/util/List;", "setProfileReleaseTypeNotificationPreferences", "(Ljava/util/List;)V", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1}, m31888xi = 48)
/* loaded from: classes2.dex */
public final class ProfileReleaseTypeNotificationPreferencesResponse extends Response {
    public List<ProfileReleaseTypeNotificationPreference> profileReleaseTypeNotificationPreferences;

    @JsonProperty("profile_release_type_notification_preferences")
    @NotNull
    public final List<ProfileReleaseTypeNotificationPreference> getProfileReleaseTypeNotificationPreferences() {
        List<ProfileReleaseTypeNotificationPreference> list = this.profileReleaseTypeNotificationPreferences;
        if (list != null) {
            return list;
        }
        Intrinsics.m32189r("profileReleaseTypeNotificationPreferences");
        throw null;
    }

    public final void setProfileReleaseTypeNotificationPreferences(@NotNull List<ProfileReleaseTypeNotificationPreference> list) {
        Intrinsics.m32179h(list, "<set-?>");
        this.profileReleaseTypeNotificationPreferences = list;
    }
}
