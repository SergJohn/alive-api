
--set extention: create extension if not exists "uuid-ossp";


CREATE TABLE users
(
    user_id uuid DEFAULT uuid_generate_v4(),
    firstName character varying,
    surname character varying,
    displayName character varying,
    password character varying,
    dob date,
    avatar character varying,
    bio character varying,
    following integer ARRAY,
    obs_config_rmrplink character varying,
    obs_config_streamkey character varying,
    live_uri character varying,
    live_image character varying,
    PRIMARY KEY (user_id)
);

INSERT INTO users VALUES ('167d5272-cb89-4384-a253-cd1a2aaa7745', 'Carolinne', 'Marques', 'corcarolinne', 'pass123', '1996-03-15', 'https://viewer-user-avatars.s3-eu-west-1.amazonaws.com/a1de584b13e93ea9_f077ebed-6e82-4806-a924-408650695bf3', 'This is my channel. Enjoy!', '{}', 'rtmps://b43189d95416.global-contribute.live-video.net:443/app/', 'sk_eu-west-1_nUmy0onKaBCh_LARWfMUkrSw9eL3LGRs7W9fCBXfWOM', 'https://b43189d95416.eu-west-1.playback.live-video.net/api/video/v1/eu-west-1.248056333272.channel.X3k9AgkWFOnT.m3u8', 'https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/110202748_114186017041375_3516819019169033276_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=4NeaVTtcN2QAX_Df_R0&_nc_ht=scontent-dub4-1.xx&oh=ce9ddd7b4b72556f6aa289c2b9fc363e&oe=60C3BE38');
INSERT INTO users VALUES ('6105aefb-fa30-4d13-bcad-7b52934d0903','Jonathan','Cristalino','jhonny','PASS123','1996-03-15','https://web.whatsapp.com/pp?e=https%3A%2F%2Fpps.whatsapp.net%2Fv%2Ft61.24694-24%2F170502600_194580065553105_9137018033825879689_n.jpg%3Fccb%3D11-4%26oh%3D768454a6ec279db33b2f4ef1f36f019e%26oe%3D60A2B904&t=l&u=353838708697%40c.us&i=1617731516&n=HwvXGemTCzTRIAKAp%2BJhvCR6eUwJKCsIooyjNYnQh%2BY%3D', 'This is my channel. Enjoy!', '{}','rtmps://b43189d95416.global-contribute.live-video.net:443/app/','sk_eu-west-1_nUmy0onKaBCh_LARWfMUkrSw9eL3LGRs7W9fCBXfWOM','https://b43189d95416.eu-west-1.playback.live-video.net/api/video/v1/eu-west-1.248056333272.channel.X3k9AgkWFOnT.m3u8', 'https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/110202748_114186017041375_3516819019169033276_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=4NeaVTtcN2QAX_Df_R0&_nc_ht=scontent-dub4-1.xx&oh=ce9ddd7b4b72556f6aa289c2b9fc363e&oe=60C3BE38');

-- mario => https://viewer-user-avatars.s3-eu-west-1.amazonaws.com/b0779bf9f07c7f85_a345ae30-54bc-4986-bdb2-c612130f657b

-- jhonny => https://viewer-user-avatars.s3-eu-west-1.amazonaws.com/a617c768c002b0ca_cb7cf57c-6cdf-4c6e-ab5f-771db5323244

-- client.query("UPDATE users SET avatar = 'https://viewer-user-avatars.s3-eu-west-1.amazonaws.com/a617c768c002b0ca_cb7cf57c-6cdf-4c6e-ab5f-771db5323244' WHERE user_id = 'eeb869c9-7b0f-428a-9874-1503d82db267');

-- [
--   {
--     id: '167d5272-cb89-4384-a253-cd1a2aaa7745',
--     firstName: 'Carolinne',
--     surname: 'Marques',
--     displayName: 'corcarolinne',
--     password: 'pass123',
--     dob: '15/03/1996',
--     avatar: 'https://viewer-user-avatars.s3-eu-west-1.amazonaws.com/a1de584b13e93ea9_f077ebed-6e82-4806-a924-408650695bf3',
--     bio: 'This is my channel. Enjoy!',
--     numberOfFollows: 0,
--     following: ['6105aefb-fa30-4d13-bcad-7b52934d0903'],
--     obs_config: {
--       rmrpLink: 'rtmps://b43189d95416.global-contribute.live-video.net:443/app/',
--       streamKey: 'sk_eu-west-1_nUmy0onKaBCh_LARWfMUkrSw9eL3LGRs7W9fCBXfWOM',
--     },
--     live: {
--       uri: 'https://b43189d95416.eu-west-1.playback.live-video.net/api/video/v1/eu-west-1.248056333272.channel.X3k9AgkWFOnT.m3u8',
--       image:
--         'https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/110202748_114186017041375_3516819019169033276_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=4NeaVTtcN2QAX_Df_R0&_nc_ht=scontent-dub4-1.xx&oh=ce9ddd7b4b72556f6aa289c2b9fc363e&oe=60C3BE38',
--     },
--   },
--   {
--     id: '6105aefb-fa30-4d13-bcad-7b52934d0903',
--     firstName: 'Jonathan',
--     surname: 'Cristalino',
--     displayName: 'jhonny',
--     password: 'pass123',
--     dob: '15/03/1996',
--     avatar:
--       'https://web.whatsapp.com/pp?e=https%3A%2F%2Fpps.whatsapp.net%2Fv%2Ft61.24694-24%2F170502600_194580065553105_9137018033825879689_n.jpg%3Fccb%3D11-4%26oh%3D768454a6ec279db33b2f4ef1f36f019e%26oe%3D60A2B904&t=l&u=353838708697%40c.us&i=1617731516&n=HwvXGemTCzTRIAKAp%2BJhvCR6eUwJKCsIooyjNYnQh%2BY%3D',
--     bio: 'This is my channel. Enjoy!',
--     numberOfFollows: 0,
--     following: ['167d5272-cb89-4384-a253-cd1a2aaa7745'],
--     obs_config: {
--       rmrpLink: 'rtmps://b43189d95416.global-contribute.live-video.net:443/app/',
--       streamKey: 'sk_eu-west-1_nUmy0onKaBCh_LARWfMUkrSw9eL3LGRs7W9fCBXfWOM',
--     },
--     live: {
--       uri: 'https://b43189d95416.eu-west-1.playback.live-video.net/api/video/v1/eu-west-1.248056333272.channel.X3k9AgkWFOnT.m3u8',
--       image:
--         'https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/110202748_114186017041375_3516819019169033276_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=4NeaVTtcN2QAX_Df_R0&_nc_ht=scontent-dub4-1.xx&oh=ce9ddd7b4b72556f6aa289c2b9fc363e&oe=60C3BE38',
--     },
--   },
--   {
--     id: 'eeb869c9-7b0f-428a-9874-1503d82db267',
--     firstName: 'Mario',
--     surname: 'Rosa',
--     displayName: 'mario',
--     password: 'pass123',
--     dob: '15/03/1996',
--     avatar:
--       'https://web.whatsapp.com/pp?e=https%3A%2F%2Fpps.whatsapp.net%2Fv%2Ft61.24694-24%2F154154974_5237519852988654_2398102619482435387_n.jpg%3Fccb%3D11-4%26oh%3D388a7ce4a857f52a271472f059693457%26oe%3D60A3C569&t=s&u=353838265569%40c.us&i=1614525338&n=RLA4c58gByv8I7AIh98Acpg55We1EC5hnvKsyzbeGfM%3D',
--     bio: 'This is my channel. Enjoy!',
--     numberOfFollows: 0,
--     following: ['167d5272-cb89-4384-a253-cd1a2aaa7745'],
--     obs_config: {
--       rmrpLink: 'rtmps://b43189d95416.global-contribute.live-video.net:443/app/',
--       streamKey: 'sk_eu-west-1_nUmy0onKaBCh_LARWfMUkrSw9eL3LGRs7W9fCBXfWOM',
--     },
--     live: {
--       uri: 'https://b43189d95416.eu-west-1.playback.live-video.net/api/video/v1/eu-west-1.248056333272.channel.X3k9AgkWFOnT.m3u8',
--       image:
--         'https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/110202748_114186017041375_3516819019169033276_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=4NeaVTtcN2QAX_Df_R0&_nc_ht=scontent-dub4-1.xx&oh=ce9ddd7b4b72556f6aa289c2b9fc363e&oe=60C3BE38',
--     },
--   },
INSERT INTO users VALUES ('1380314b-f337-4d5f-ba1e-24fbf66f33fe', 'guest', 'guest', 'guest', 'guest', '1996-03-15', '', 'This is my channel.', '{}', 'rtmps://b43189d95416.global-contribute.live-video.net:443/app/', 'sk_eu-west-1_nUmy0onKaBCh_LARWfMUkrSw9eL3LGRs7W9fCBXfWOM', 'https://b43189d95416.eu-west-1.playback.live-video.net/api/video/v1/eu-west-1.248056333272.channel.X3k9AgkWFOnT.m3u8', 'https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/110202748_114186017041375_3516819019169033276_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=4NeaVTtcN2QAX_Df_R0&_nc_ht=scontent-dub4-1.xx&oh=ce9ddd7b4b72556f6aa289c2b9fc363e&oe=60C3BE38');
--   {
--     id: '1380314b-f337-4d5f-ba1e-24fbf66f33fe',
--     firstName: 'guest',
--     surname: 'guest',
--     displayName: 'guest',
--     password: 'guest',
--     dob: '15/03/1996',
--     avatar: '',
--     bio: 'This is a guest channel!',
--     numberOfFollows: 0,
--     following: ['6105aefb-fa30-4d13-bcad-7b52934d0903'],
--     obs_config: {
--       rmrpLink: 'rtmps://b43189d95416.global-contribute.live-video.net:443/app/',
--       streamKey: 'sk_eu-west-1_nUmy0onKaBCh_LARWfMUkrSw9eL3LGRs7W9fCBXfWOM',
--     },
--     live: {
--       uri: 'https://b43189d95416.eu-west-1.playback.live-video.net/api/video/v1/eu-west-1.248056333272.channel.X3k9AgkWFOnT.m3u8',
--       image:
--         'https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/110202748_114186017041375_3516819019169033276_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=4NeaVTtcN2QAX_Df_R0&_nc_ht=scontent-dub4-1.xx&oh=ce9ddd7b4b72556f6aa289c2b9fc363e&oe=60C3BE38',
--     },
--   },
-- ]