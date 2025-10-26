module gogs.io/gogs

go 1.24.0

toolchain go1.24.9

require (
	github.com/Masterminds/semver/v3 v3.4.0
	github.com/derision-test/go-mockgen v1.3.7
	github.com/editorconfig/editorconfig-core-go/v2 v2.6.3
	github.com/go-ldap/ldap/v3 v3.4.12
	github.com/go-macaron/binding v1.2.0
	github.com/go-macaron/cache v0.0.0-20200329073519-53bb48172687
	github.com/go-macaron/captcha v0.2.0
	github.com/go-macaron/csrf v0.0.0-20200329073418-5d38f39de352
	github.com/go-macaron/gzip v0.0.0-20200329073552-98214d7a897e
	github.com/go-macaron/i18n v0.6.0
	github.com/go-macaron/session v1.0.3
	github.com/go-macaron/toolbox v0.0.0-20200329073429-4401f4ce0f55
	github.com/gogs/chardet v0.0.0-20211120154057-b7413eaefb8f
	github.com/gogs/cron v0.0.0-20171120032916-9f6c956d3e14
	github.com/gogs/git-module v1.8.4
	github.com/gogs/go-gogs-client v0.0.0-20210131175652-1d7215cd8d85
	github.com/gogs/go-libravatar v0.0.0-20191106065024-33a75213d0a0
	github.com/gogs/minwinsvc v0.0.0-20170301035411-95be6356811a
	github.com/google/go-github v17.0.0+incompatible
	github.com/issue9/identicon v1.2.1
	github.com/json-iterator/go v1.1.12
	github.com/microcosm-cc/bluemonday v1.0.27
	github.com/msteinert/pam v1.2.0
	github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646
	github.com/niklasfasching/go-org v1.9.1
	github.com/olekukonko/tablewriter v1.1.0
	github.com/pkg/errors v0.9.1
	github.com/pquerna/otp v1.5.0
	github.com/prometheus/client_golang v1.23.2
	github.com/russross/blackfriday v1.6.0
	github.com/satori/go.uuid v1.2.0
	github.com/sergi/go-diff v1.4.0
	github.com/sourcegraph/run v0.12.0
	github.com/stretchr/testify v1.11.1
	github.com/unknwon/cae v1.0.2
	github.com/unknwon/com v1.0.1
	github.com/unknwon/i18n v0.0.0-20210904045753-ff3a8617e361
	github.com/unknwon/paginater v0.0.0-20200328080006-042474bd0eae
	github.com/urfave/cli/v2 v2.27.7
	golang.org/x/crypto v0.43.0
	golang.org/x/net v0.46.0
	golang.org/x/text v0.30.0
	gopkg.in/DATA-DOG/go-sqlmock.v2 v2.0.0-20180914054222-c19298f520d0
	gopkg.in/gomail.v2 v2.0.0-20160411212932-81ebce5c23df
	gopkg.in/ini.v1 v1.67.0
	gopkg.in/macaron.v1 v1.5.1
	gorm.io/driver/mysql v1.5.2
	gorm.io/driver/postgres v1.6.0
	gorm.io/driver/sqlite v1.4.2
	gorm.io/driver/sqlserver v1.6.1
	gorm.io/gorm v1.30.0
	modernc.org/sqlite v1.38.2
	unknwon.dev/clog/v2 v2.2.0
	xorm.io/builder v0.3.6
	xorm.io/core v0.7.2
	xorm.io/xorm v0.8.0
)

require (
	bitbucket.org/creachadair/shell v0.0.8 // indirect
	filippo.io/edwards25519 v1.1.0 // indirect
	github.com/Azure/go-ntlmssp v0.0.0-20221128193559-754e69321358 // indirect
	github.com/aymerick/douceur v0.2.0 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/boombuler/barcode v1.1.0 // indirect
	github.com/bradfitz/gomemcache v0.0.0-20250403215159-8d39553ac7cf // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/clipperhouse/uax29/v2 v2.2.0 // indirect
	github.com/cpuguy83/go-md2man/v2 v2.0.7 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/djherbis/buffer v1.2.0 // indirect
	github.com/djherbis/nio/v3 v3.0.1 // indirect
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/fatih/color v1.18.0 // indirect
	github.com/go-asn1-ber/asn1-ber v1.5.8-0.20250403174932-29230038a667 // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-macaron/inject v0.0.0-20200308113650-138e5925c53b // indirect
	github.com/go-redis/redis/v8 v8.11.5 // indirect
	github.com/go-sql-driver/mysql v1.9.3 // indirect
	github.com/golang-sql/civil v0.0.0-20220223132316-b832511892a9 // indirect
	github.com/golang-sql/sqlexp v0.1.0 // indirect
	github.com/google/go-querystring v1.1.0 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/gorilla/css v1.0.1 // indirect
	github.com/itchyny/gojq v0.12.17 // indirect
	github.com/itchyny/timefmt-go v0.1.7 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgservicefile v0.0.0-20240606120523-5a60cdf6a761 // indirect
	github.com/jackc/pgx/v5 v5.7.6 // indirect
	github.com/jackc/puddle/v2 v2.2.2 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.5 // indirect
	github.com/klauspost/compress v1.18.1 // indirect
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/mattn/go-runewidth v0.0.19 // indirect
	github.com/mattn/go-sqlite3 v1.14.32 // indirect
	github.com/mcuadros/go-version v0.0.0-20190830083331-035f6764e8d2 // indirect
	github.com/microsoft/go-mssqldb v1.9.3 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/ncruces/go-strftime v0.1.9 // indirect
	github.com/olekukonko/cat v0.0.0-20250911104152-50322a0618f6 // indirect
	github.com/olekukonko/errors v1.1.0 // indirect
	github.com/olekukonko/ll v0.1.2 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_model v0.6.2 // indirect
	github.com/prometheus/common v0.67.1 // indirect
	github.com/prometheus/procfs v0.19.1 // indirect
	github.com/remyoudompheng/bigfft v0.0.0-20230129092748-24d4a6f8daec // indirect
	github.com/rivo/uniseg v0.4.7 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/xrash/smetrics v0.0.0-20250705151800-55b8f293f342 // indirect
	go.bobheadxi.dev/streamline v1.3.2 // indirect
	go.opentelemetry.io/auto/sdk v1.2.1 // indirect
	go.opentelemetry.io/otel v1.38.0 // indirect
	go.opentelemetry.io/otel/metric v1.38.0 // indirect
	go.opentelemetry.io/otel/trace v1.38.0 // indirect
	go.yaml.in/yaml/v2 v2.4.3 // indirect
	golang.org/x/exp v0.0.0-20250620022241-b7579e27df2b // indirect
	golang.org/x/mod v0.29.0 // indirect
	golang.org/x/sync v0.17.0 // indirect
	golang.org/x/sys v0.37.0 // indirect
	google.golang.org/protobuf v1.36.10 // indirect
	gopkg.in/alexcesaro/quotedprintable.v3 v3.0.0-20150716171945-2caba252f4dc // indirect
	gopkg.in/bufio.v1 v1.0.0-20140618132640-567b2bfa514e // indirect
	gopkg.in/redis.v2 v2.3.2 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	modernc.org/libc v1.66.3 // indirect
	modernc.org/mathutil v1.7.1 // indirect
	modernc.org/memory v1.11.0 // indirect
)
