(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v4 ?v12)
             (pred_1 ?v10 ?v6)
             (pred_12 ?v4 ?v6)
             (pred_5 ?v5 ?v4 )
	     (pred_4 ?v4)
             (pred_9 ?v9)
             (pred_11 ?v10)
             (pred_3 ?v6)
             (pred_10 ?v4)
             (pred_2 ?v10)
             (pred_6 ?v4)
             (pred_8 ))



(:action op_2
:parameters (?v2 ?v3 ?v13 ?v7)
:precondition (and (pred_9 ?v2) (pred_9 ?v3) (pred_11 ?v13) (pred_3 ?v7)
          (pred_7 ?v2 ?v3) (pred_1 ?v13 ?v7)
                   (pred_12 ?v3 ?v7) (pred_4 ?v2) 
                   (pred_10 ?v3) (pred_2 ?v13))
:effect (and  (pred_6 ?v3) (not (pred_10 ?v3))))


(:action op_5
:parameters (?v2 ?v8)
:precondition (and (pred_9 ?v2) (pred_9 ?v8)
               (pred_4 ?v2) (pred_7 ?v2 ?v8) (pred_6 ?v8))
:effect (and (pred_4 ?v8) (not (pred_4 ?v2))))

(:action op_3
:parameters (?v2 ?v13)
:precondition (and (pred_9 ?v2) (pred_11 ?v13) 
                  (pred_4 ?v2) (pred_5 ?v13 ?v2) (pred_8 ))
:effect (and (pred_2 ?v13)
   (not (pred_5 ?v13 ?v2)) (not (pred_8 ))))


(:action op_4
:parameters (?v2 ?v1 ?v11)
:precondition (and (pred_9 ?v2) (pred_11 ?v1) (pred_11 ?v11)
                  (pred_4 ?v2) (pred_2 ?v11) (pred_5 ?v1 ?v2))
:effect (and (pred_2 ?v1) (pred_5 ?v11 ?v2)
        (not (pred_2 ?v11)) (not (pred_5 ?v1 ?v2))))

(:action op_1
:parameters (?v2 ?v13)
:precondition (and (pred_9 ?v2) (pred_11 ?v13) 
                  (pred_4 ?v2) (pred_2 ?v13))
:effect (and (pred_8 ) (pred_5 ?v13 ?v2) (not (pred_2 ?v13)))))


	
