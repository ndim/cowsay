# Licensing for Cowsay

This document is Andrew Janke's view of Cowsay's licensing situation, written in 2024. It is not authoritative; just my understanding.

## Summary

I'm not entirely sure what the effective license for Cowsay is. I think it's multi-licensed (use any) under Artistic License 1.0, GPL 1.0, and GPL 3.0, with the GPL 3.0 grant maybe not applying to all files.

## Analysis

The licensing situation for parts of Cowsay is a little unclear as of 2024-08. Cowsay was originally licensed under a custom license grant statement like this in the LICENSE file, up through version 3.03 AFAICT.

```
cowsay is distributed under the same licensing terms as Perl: the
Artistic License or the GNU General Public License.  If you don't
want to track down these licenses and read them for yourself, use
the parts that I'd prefer[...]
```

It doesn't specify a particular version of the GPL. I think that means either v1, or whatever version(s) and license application terms Perl was using as of May 2000 (or Nov 2002, when "blowfish" was committed), per that "same licensing terms" statement.

In the [rank-amateur-cowsay GitHub repo post](https://github.com/tnalpgge/rank-amateur-cowsay), in a 2016-06-24 [commit 99058032db7](), the licensing info in the repo was changed to say specifically GPLv3, and references to the Artistic License were removed. The LICENSE file was changed to a copy of the GPL v3.0, and an entry in the ChangeLog says this:

```
  - Licensing terms have changed to GPLv3.
```

It's unclear to me whether that "actually worked" to apply GPLv3 to the files contributed by other authors, if they weren't already covered by GPLv3 via the previous licensing terms. There's no formal copyright assignment or contributor licensing agreement.

My non-expert view is that this means that Cowsay, at least all the code that was in there as of Nov 2002, is dual licensed under Artistic License and the GPL that Perl used, and the 2022 re-licensing adds a GPLv3 specific license grant, except maybe for files by authors besides Tony, without removing the effect of the old grants.

As of 2024-08, the cowsay-org fork doesn't have a formal contributor licensing or copyright assignment agreement. And since posting the fork, I've been referring to Cowsay as GPLv3, including in the in-repo documentation and GitHub license label. So you could make an argument that code contributed by new authors to cowsay-org since the fork is implicitly GPLv3, and not Artistic License or older GPL. Probably need a lawyer to say anything there with confidence, though.

As of 2024-08-25, I'm working on clearing this situation up and documenting it better. Work is being done under issue [#64 "Extra cows in Debian"](https://github.com/cowsay-org/cowsay/issues/64).

The `classic-docs-archive/` directory under this `doc-project/` dir contains copies of the original files from classic Cowsay as of those relevant 3.03 and 3.04 states, to help understand this situation.

The Homebrew maintainers seem to believe that Cowsay is effectively multi-licensed under Artistic License 1.0 and GPL 1.0 or later. It's discussed in [#61717 "cowsay: Don't install offensive ASCII art"](https://github.com/Homebrew/homebrew-core/pull/61717). Comment from dawidd6:

> Author states in the LICENSE file, that their software is licensed the same way perl is, so it should be changed to:
>
> ```license any_of: ["Artistic-1.0-Perl", "GPL-1.0-or-later"]```

### Cowsay 4

It looks like there was a "Cowsay 4" release that didn't make it in to Tony's rank-amateur-cowsay GitHub repo, but did get posted on MetaCPAN as package Acme-Cow, with versions going up to 0.2.1. The Acme-Cow distribution captured on the Wayback Machine copy of Tony's Cowsay page was 0.1. OpenBSD is using this Acme-Cow 0.2.1 for their cowsay package as of 2022 or so. I don't see license info in their metadata.

## Copyright

The original cowsay LICENSE file had this statement. And it wasn't updated with commits done in later years.

```
(0) Copyright (c) 1999 Tony Monroe.  All rights reserved.  All
lefts may or may not be reversed at my discretion.
```

I think that means an up to date formal copyright statement, in Debian style, would look like the following, plus additional entries for all the files contributed by other authors:

```
Copyright 1999-2002 Tony Monroe
Copyright 2016-2024 Andrew Janke
```


