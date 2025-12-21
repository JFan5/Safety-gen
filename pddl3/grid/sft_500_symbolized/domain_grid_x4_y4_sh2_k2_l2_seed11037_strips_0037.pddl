(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v6)
             (pred_5 ?v5 ?v11)
             (pred_12 ?v8 ?v11)
             (pred_4 ?v1 ?v8 )
	     (pred_3 ?v8)
             (pred_9 ?v3)
             (pred_8 ?v5)
             (pred_1 ?v11)
             (pred_11 ?v8)
             (pred_10 ?v5)
             (pred_6 ?v8)
             (pred_7 ))



(:action op_2
:parameters (?v2 ?v12 ?v7 ?v10)
:precondition (and (pred_9 ?v2) (pred_9 ?v12) (pred_8 ?v7) (pred_1 ?v10)
          (pred_2 ?v2 ?v12) (pred_5 ?v7 ?v10)
                   (pred_12 ?v12 ?v10) (pred_3 ?v2) 
                   (pred_11 ?v12) (pred_10 ?v7))
:effect (and  (pred_6 ?v12) (not (pred_11 ?v12))))


(:action op_1
:parameters (?v2 ?v13)
:precondition (and (pred_9 ?v2) (pred_9 ?v13)
               (pred_3 ?v2) (pred_2 ?v2 ?v13) (pred_6 ?v13))
:effect (and (pred_3 ?v13) (not (pred_3 ?v2))))

(:action op_5
:parameters (?v2 ?v7)
:precondition (and (pred_9 ?v2) (pred_8 ?v7) 
                  (pred_3 ?v2) (pred_4 ?v7 ?v2) (pred_7 ))
:effect (and (pred_10 ?v7)
   (not (pred_4 ?v7 ?v2)) (not (pred_7 ))))


(:action op_3
:parameters (?v2 ?v4 ?v9)
:precondition (and (pred_9 ?v2) (pred_8 ?v4) (pred_8 ?v9)
                  (pred_3 ?v2) (pred_10 ?v9) (pred_4 ?v4 ?v2))
:effect (and (pred_10 ?v4) (pred_4 ?v9 ?v2)
        (not (pred_10 ?v9)) (not (pred_4 ?v4 ?v2))))

(:action op_4
:parameters (?v2 ?v7)
:precondition (and (pred_9 ?v2) (pred_8 ?v7) 
                  (pred_3 ?v2) (pred_10 ?v7))
:effect (and (pred_7 ) (pred_4 ?v7 ?v2) (not (pred_10 ?v7)))))


	
