package com.swiftsoft.anixartd.epoxy;

import android.os.Handler;
import com.airbnb.epoxy.EpoxyController;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* compiled from: Typed10EpoxyController.kt */
@Metadata(m31883d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0006\b&\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u0002*\u0004\b\u0002\u0010\u0003*\u0004\b\u0003\u0010\u0004*\u0004\b\u0004\u0010\u0005*\u0004\b\u0005\u0010\u0006*\u0004\b\u0006\u0010\u0007*\u0004\b\u0007\u0010\b*\u0004\b\b\u0010\t*\u0004\b\t\u0010\n2\u00020\u000bB\u0007\b\u0016¢\u0006\u0002\u0010\fB\u0017\b\u0016\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u000e¢\u0006\u0002\u0010\u0010J\b\u0010\u001e\u001a\u00020\u001fH\u0014J]\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00028\u00012\u0006\u0010\u0017\u001a\u00028\u00022\u0006\u0010\u0018\u001a\u00028\u00032\u0006\u0010\u0019\u001a\u00028\u00042\u0006\u0010\u001a\u001a\u00028\u00052\u0006\u0010\u001b\u001a\u00028\u00062\u0006\u0010\u001c\u001a\u00028\u00072\u0006\u0010\u001d\u001a\u00028\b2\u0006\u0010\u0015\u001a\u00028\tH$¢\u0006\u0002\u0010 J\u0018\u0010!\u001a\u00020\u001f2\u0006\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020#H\u0016J\u0010\u0010%\u001a\u00020\u001f2\u0006\u0010&\u001a\u00020#H\u0016J\b\u0010'\u001a\u00020\u001fH\u0016J[\u0010(\u001a\u00020\u001f2\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00028\u00012\u0006\u0010\u0017\u001a\u00028\u00022\u0006\u0010\u0018\u001a\u00028\u00032\u0006\u0010\u0019\u001a\u00028\u00042\u0006\u0010\u001a\u001a\u00028\u00052\u0006\u0010\u001b\u001a\u00028\u00062\u0006\u0010\u001c\u001a\u00028\u00072\u0006\u0010\u001d\u001a\u00028\b2\u0006\u0010\u0015\u001a\u00028\t¢\u0006\u0002\u0010 R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u0013\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u0015\u001a\u0004\u0018\u00018\tX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u0016\u001a\u0004\u0018\u00018\u0001X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u0017\u001a\u0004\u0018\u00018\u0002X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u0018\u001a\u0004\u0018\u00018\u0003X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u0019\u001a\u0004\u0018\u00018\u0004X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u001a\u001a\u0004\u0018\u00018\u0005X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u001b\u001a\u0004\u0018\u00018\u0006X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u001c\u001a\u0004\u0018\u00018\u0007X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u001d\u001a\u0004\u0018\u00018\bX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014¨\u0006)"}, m31884d2 = {"Lcom/swiftsoft/anixartd/epoxy/Typed10EpoxyController;", "T", "U", "V", "W", "X", "Y", "Z", "S", "Q", "F", "Lcom/airbnb/epoxy/EpoxyController;", "()V", "modelBuildingHandler", "Landroid/os/Handler;", "diffingHandler", "(Landroid/os/Handler;Landroid/os/Handler;)V", "allowModelBuildRequests", "", "data1", "Ljava/lang/Object;", "data10", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "buildModels", "", "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V", "moveModel", "fromPosition", "", "toPosition", "requestDelayedModelBuild", "delayMs", "requestModelBuild", "setData", "app_release"}, m31885k = 1, m31886mv = {1, 7, 1}, m31888xi = 48)
/* loaded from: classes2.dex */
public abstract class Typed10EpoxyController<T, U, V, W, X, Y, Z, S, Q, F> extends EpoxyController {
    private boolean allowModelBuildRequests;

    @Nullable
    private T data1;

    @Nullable
    private F data10;

    @Nullable
    private U data2;

    @Nullable
    private V data3;

    @Nullable
    private W data4;

    @Nullable
    private X data5;

    @Nullable
    private Y data6;

    @Nullable
    private Z data7;

    @Nullable
    private S data8;

    @Nullable
    private Q data9;

    public Typed10EpoxyController() {
    }

    @Override // com.airbnb.epoxy.EpoxyController
    public void buildModels() {
        if (!isBuildingModels()) {
            throw new IllegalStateException("You cannot call `buildModels` directly. Call `setData` instead to trigger a model refresh with new data.");
        }
        T t = this.data1;
        U u = this.data2;
        V v = this.data3;
        W w = this.data4;
        X x = this.data5;
        Y y = this.data6;
        Z z = this.data7;
        S s = this.data8;
        Q q = this.data9;
        F f2 = this.data10;
        if (t == null || u == null || v == null || w == null || x == null || y == null || z == null || s == null || q == null || f2 == null) {
            throw new Exception("Invalid params (mustn't be null)");
        }
        buildModels(t, u, v, w, x, y, z, s, q, f2);
    }

    public abstract void buildModels(T data1, U data2, V data3, W data4, X data5, Y data6, Z data7, S data8, Q data9, F data10);

    @Override // com.airbnb.epoxy.EpoxyController
    public void moveModel(int fromPosition, int toPosition) {
        this.allowModelBuildRequests = true;
        super.moveModel(fromPosition, toPosition);
        this.allowModelBuildRequests = false;
    }

    @Override // com.airbnb.epoxy.EpoxyController
    public void requestDelayedModelBuild(int delayMs) {
        if (!this.allowModelBuildRequests) {
            throw new IllegalStateException("You cannot call `requestModelBuild` directly. Call `setData` instead to trigger a model refresh with new data.");
        }
        super.requestDelayedModelBuild(delayMs);
    }

    @Override // com.airbnb.epoxy.EpoxyController
    public void requestModelBuild() {
        if (!this.allowModelBuildRequests) {
            throw new IllegalStateException("You cannot call `requestModelBuild` directly. Call `setData` instead to trigger a model refresh with new data.");
        }
        super.requestModelBuild();
    }

    public final void setData(T data1, U data2, V data3, W data4, X data5, Y data6, Z data7, S data8, Q data9, F data10) {
        this.data1 = data1;
        this.data2 = data2;
        this.data3 = data3;
        this.data4 = data4;
        this.data5 = data5;
        this.data6 = data6;
        this.data7 = data7;
        this.data8 = data8;
        this.data9 = data9;
        this.data10 = data10;
        this.allowModelBuildRequests = true;
        requestModelBuild();
        this.allowModelBuildRequests = false;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Typed10EpoxyController(@NotNull Handler modelBuildingHandler, @NotNull Handler diffingHandler) {
        super(modelBuildingHandler, diffingHandler);
        Intrinsics.m32179h(modelBuildingHandler, "modelBuildingHandler");
        Intrinsics.m32179h(diffingHandler, "diffingHandler");
    }
}
