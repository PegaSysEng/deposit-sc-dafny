/*
 * Copyright 2020 ConsenSys AG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may 
 * not use this file except in compliance with the License. You may obtain 
 * a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software dis-
 * tributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the 
 * License for the specific language governing permissions and limitations 
 * under the License.
 */

/**
 *  Provide useful lemmas on sequences.
 */
module SeqHelpers {

    /**
     * First element of a sequence.
     *  
     *  @param  p   A sequence of length >= 1.
     *  @returns    The first element.
     */
    function method first<T>(p : seq<T>) : T
        requires 1 <= |p|
    {
        p[0]
    }

    /**
     * Tail  of a sequence.
     *  
     *  @param  p   A sequence of length >= 1.
     *  @returns    The tail (all but first element).
     */
    function method tail<T>(p : seq<T>) : seq<T>
        requires 1 <= |p|
    {
        p[1..]
    }

    /**
     *  Initial prefix of a sequence.
     *  
     *  @param  p   A sequence of length >= 1.
     *  @returns    The sequence p minus the last element.
     */
    function method init<T>(p : seq<T>) : seq<T>
        requires 1 <= |p|
        ensures |init(p)| == |p| - 1
    {
        p[..|p| - 1]
    }

   /**
     *  Last element of a sequence.
     *  
     *  @param  p   A sequence of length >= 1.
     *  @returns    The last element of p.
     */
    function method last<T>(p : seq<T>) : T
        requires 1 <= |p|
    {
        p[|p| - 1]
    }

    /**
     *  k-Prefix of a sequence.
     *  
     *  @param  p   A sequence.
     *  @param  k   A integer between 0 and |p|.
     *  @returns    The sequence made of the first k elements of p.
     */
    function method  take<T>(p : seq<T>, k : nat) : seq<T>
        requires |p| >= k 
        ensures |take(p, k)| == k
    {
        p[..k]
    }

   /**
     *  Suffix of a sequence.
     *  
     *  @param  p   A sequence.
     *  @param  k   A integer between 0 and |p|.
     *  @returns    The sequence made of the last k - |p| elements of p.
     */
    function method  drop<T>(p : seq<T>, k : nat) : seq<T>
        requires |p| >= k 
        ensures |drop(p, k)| == |p| - k
    {
        p[k..]
    }

    //  Useful lemmas on init, last, take and drop.
    lemma seqLemmas<T>(p : seq<T>) 
        requires 1 <= |p|
        ensures p == init(p) + [last(p)]
        ensures init(p) == take(p, |p| - 1)
        ensures [last(p)] == drop(p, |p| - 1) 
        ensures [first(p)] == take(p, 1)
        ensures tail(p) == drop(p, 1)
    {   
        //  Thanks Dafny
    }

    lemma seqIndexLemmas<T>(p : seq<T>, k : nat) 
        requires 1 <= |p|
        requires 0 <= k < |p| 
        ensures take(p, k) == take(init(p), k)
        ensures 0 <= k < |init(p)| ==> p[k] == init(p)[k]
    {   
        //  Thanks Dafny
    }

    lemma seqAppendLemmas<T>(p : seq<T>, a : T)
        requires |p| >= 1
        ensures init(p + [a]) == p 
        ensures tail(p + [a]) == tail(p) + [a]
    {

    }
}