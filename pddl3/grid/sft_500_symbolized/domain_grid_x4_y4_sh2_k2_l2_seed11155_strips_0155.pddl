(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v10 ?v1)
             (pred_6 ?v6 ?v8)
             (pred_2 ?v10 ?v8)
             (pred_10 ?v3 ?v10 )
	     (pred_11 ?v10)
             (pred_8 ?v11)
             (pred_5 ?v6)
             (pred_4 ?v8)
             (pred_12 ?v10)
             (pred_3 ?v6)
             (pred_7 ?v10)
             (pred_9 ))



(:action op_1
:parameters (?v2 ?v12 ?v9 ?v4)
:precondition (and (pred_8 ?v2) (pred_8 ?v12) (pred_5 ?v9) (pred_4 ?v4)
          (pred_1 ?v2 ?v12) (pred_6 ?v9 ?v4)
                   (pred_2 ?v12 ?v4) (pred_11 ?v2) 
                   (pred_12 ?v12) (pred_3 ?v9))
:effect (and  (pred_7 ?v12) (not (pred_12 ?v12))))


(:action op_3
:parameters (?v2 ?v13)
:precondition (and (pred_8 ?v2) (pred_8 ?v13)
               (pred_11 ?v2) (pred_1 ?v2 ?v13) (pred_7 ?v13))
:effect (and (pred_11 ?v13) (not (pred_11 ?v2))))

(:action op_5
:parameters (?v2 ?v9)
:precondition (and (pred_8 ?v2) (pred_5 ?v9) 
                  (pred_11 ?v2) (pred_10 ?v9 ?v2) (pred_9 ))
:effect (and (pred_3 ?v9)
   (not (pred_10 ?v9 ?v2)) (not (pred_9 ))))


(:action op_2
:parameters (?v2 ?v7 ?v5)
:precondition (and (pred_8 ?v2) (pred_5 ?v7) (pred_5 ?v5)
                  (pred_11 ?v2) (pred_3 ?v5) (pred_10 ?v7 ?v2))
:effect (and (pred_3 ?v7) (pred_10 ?v5 ?v2)
        (not (pred_3 ?v5)) (not (pred_10 ?v7 ?v2))))

(:action op_4
:parameters (?v2 ?v9)
:precondition (and (pred_8 ?v2) (pred_5 ?v9) 
                  (pred_11 ?v2) (pred_3 ?v9))
:effect (and (pred_9 ) (pred_10 ?v9 ?v2) (not (pred_3 ?v9)))))


	
