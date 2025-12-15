(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v7 ?v1)
             (pred_5 ?v2 ?v11)
             (pred_1 ?v7 ?v11)
             (pred_10 ?v10 ?v7 )
	     (pred_11 ?v7)
             (pred_7 ?v9)
             (pred_2 ?v2)
             (pred_8 ?v11)
             (pred_6 ?v7)
             (pred_3 ?v2)
             (pred_9 ?v7)
             (pred_4 ))



(:action op_3
:parameters (?v3 ?v4 ?v5 ?v6)
:precondition (and (pred_7 ?v3) (pred_7 ?v4) (pred_2 ?v5) (pred_8 ?v6)
          (pred_12 ?v3 ?v4) (pred_5 ?v5 ?v6)
                   (pred_1 ?v4 ?v6) (pred_11 ?v3) 
                   (pred_6 ?v4) (pred_3 ?v5))
:effect (and  (pred_9 ?v4) (not (pred_6 ?v4))))


(:action op_5
:parameters (?v3 ?v8)
:precondition (and (pred_7 ?v3) (pred_7 ?v8)
               (pred_11 ?v3) (pred_12 ?v3 ?v8) (pred_9 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v3))))

(:action op_2
:parameters (?v3 ?v5)
:precondition (and (pred_7 ?v3) (pred_2 ?v5) 
                  (pred_11 ?v3) (pred_10 ?v5 ?v3) (pred_4 ))
:effect (and (pred_3 ?v5)
   (not (pred_10 ?v5 ?v3)) (not (pred_4 ))))


(:action op_4
:parameters (?v3 ?v12 ?v13)
:precondition (and (pred_7 ?v3) (pred_2 ?v12) (pred_2 ?v13)
                  (pred_11 ?v3) (pred_3 ?v13) (pred_10 ?v12 ?v3))
:effect (and (pred_3 ?v12) (pred_10 ?v13 ?v3)
        (not (pred_3 ?v13)) (not (pred_10 ?v12 ?v3))))

(:action op_1
:parameters (?v3 ?v5)
:precondition (and (pred_7 ?v3) (pred_2 ?v5) 
                  (pred_11 ?v3) (pred_3 ?v5))
:effect (and (pred_4 ) (pred_10 ?v5 ?v3) (not (pred_3 ?v5)))))


	
