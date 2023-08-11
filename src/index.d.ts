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

export interface MockPlayer {
	UserId: number;
	Name: string;
	DisplayName: string;
}

export declare const getUserInfo: () => UserInfo;
export declare const getUserId: () => number;
export declare const getUsername: () => string;
export declare const getDisplayName: () => string;
export declare const getUserThumbnail: (thumbnailType: Enum.ThumbnailType, thumbnailSize: Enum.ThumbnailSize) => string;
export declare const createMockPlayer: () => MockPlayer;
export declare const createList: <TReturn>(fn: () => TReturn, count: number) => TReturn[];
export declare const createUniqueList: <TReturn>(fn: () => TReturn, count: number) => TReturn[];