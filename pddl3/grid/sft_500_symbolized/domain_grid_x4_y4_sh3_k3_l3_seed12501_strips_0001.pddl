(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v1 ?v13)
             (pred_9 ?v7 ?v6)
             (pred_1 ?v1 ?v6)
             (pred_10 ?v11 ?v1 )
	     (pred_7 ?v1)
             (pred_5 ?v8)
             (pred_4 ?v7)
             (pred_8 ?v6)
             (pred_6 ?v1)
             (pred_11 ?v7)
             (pred_12 ?v1)
             (pred_2 ))



(:action op_2
:parameters (?v12 ?v3 ?v2 ?v5)
:precondition (and (pred_5 ?v12) (pred_5 ?v3) (pred_4 ?v2) (pred_8 ?v5)
          (pred_3 ?v12 ?v3) (pred_9 ?v2 ?v5)
                   (pred_1 ?v3 ?v5) (pred_7 ?v12) 
                   (pred_6 ?v3) (pred_11 ?v2))
:effect (and  (pred_12 ?v3) (not (pred_6 ?v3))))


(:action op_5
:parameters (?v12 ?v4)
:precondition (and (pred_5 ?v12) (pred_5 ?v4)
               (pred_7 ?v12) (pred_3 ?v12 ?v4) (pred_12 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v12))))

(:action op_1
:parameters (?v12 ?v2)
:precondition (and (pred_5 ?v12) (pred_4 ?v2) 
                  (pred_7 ?v12) (pred_10 ?v2 ?v12) (pred_2 ))
:effect (and (pred_11 ?v2)
   (not (pred_10 ?v2 ?v12)) (not (pred_2 ))))


(:action op_4
:parameters (?v12 ?v9 ?v10)
:precondition (and (pred_5 ?v12) (pred_4 ?v9) (pred_4 ?v10)
                  (pred_7 ?v12) (pred_11 ?v10) (pred_10 ?v9 ?v12))
:effect (and (pred_11 ?v9) (pred_10 ?v10 ?v12)
        (not (pred_11 ?v10)) (not (pred_10 ?v9 ?v12))))

(:action op_3
:parameters (?v12 ?v2)
:precondition (and (pred_5 ?v12) (pred_4 ?v2) 
                  (pred_7 ?v12) (pred_11 ?v2))
:effect (and (pred_2 ) (pred_10 ?v2 ?v12) (not (pred_11 ?v2)))))


	
