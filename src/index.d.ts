export interface UserInfo {
	description: string;
	created: string;
	isBanned: boolean;
	externalAppDisplayName?: string;
	hasVerifiedBadge: boolean;
	id: number;
	name: string;
	displayName: string;
}

export interface FakePlayer {
	UserId: number;
	Name: string;
	DisplayName: string;
}

export declare const getUserInfo: () => UserInfo;
export declare const getUserId: () => number;
export declare const getUsername: () => string;
export declare const getDisplayName: () => string;
export declare const getUserThumbnail: (thumbnailType: Enum.ThumbnailType, thumbnailSize: Enum.ThumbnailSize) => string;
export declare const createFakePlayer: () => FakePlayer;
export declare const createList: <TReturn>(fn: () => TReturn, count: number) => TReturn[];
