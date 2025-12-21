(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v2 ?v8)
             (pred_1 ?v1 ?v9)
             (pred_4 ?v2 ?v9)
             (pred_2 ?v10 ?v2 )
	     (pred_6 ?v2)
             (pred_11 ?v13)
             (pred_5 ?v1)
             (pred_9 ?v9)
             (pred_8 ?v2)
             (pred_10 ?v1)
             (pred_7 ?v2)
             (pred_12 ))



(:action op_1
:parameters (?v12 ?v4 ?v5 ?v7)
:precondition (and (pred_11 ?v12) (pred_11 ?v4) (pred_5 ?v5) (pred_9 ?v7)
          (pred_3 ?v12 ?v4) (pred_1 ?v5 ?v7)
                   (pred_4 ?v4 ?v7) (pred_6 ?v12) 
                   (pred_8 ?v4) (pred_10 ?v5))
:effect (and  (pred_7 ?v4) (not (pred_8 ?v4))))


(:action op_4
:parameters (?v12 ?v3)
:precondition (and (pred_11 ?v12) (pred_11 ?v3)
               (pred_6 ?v12) (pred_3 ?v12 ?v3) (pred_7 ?v3))
:effect (and (pred_6 ?v3) (not (pred_6 ?v12))))

(:action op_3
:parameters (?v12 ?v5)
:precondition (and (pred_11 ?v12) (pred_5 ?v5) 
                  (pred_6 ?v12) (pred_2 ?v5 ?v12) (pred_12 ))
:effect (and (pred_10 ?v5)
   (not (pred_2 ?v5 ?v12)) (not (pred_12 ))))


(:action op_2
:parameters (?v12 ?v11 ?v6)
:precondition (and (pred_11 ?v12) (pred_5 ?v11) (pred_5 ?v6)
                  (pred_6 ?v12) (pred_10 ?v6) (pred_2 ?v11 ?v12))
:effect (and (pred_10 ?v11) (pred_2 ?v6 ?v12)
        (not (pred_10 ?v6)) (not (pred_2 ?v11 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_11 ?v12) (pred_5 ?v5) 
                  (pred_6 ?v12) (pred_10 ?v5))
:effect (and (pred_12 ) (pred_2 ?v5 ?v12) (not (pred_10 ?v5)))))


	
