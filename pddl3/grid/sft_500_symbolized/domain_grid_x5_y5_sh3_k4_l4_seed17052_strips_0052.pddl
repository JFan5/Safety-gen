(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v3 ?v13)
             (pred_6 ?v8 ?v10)
             (pred_7 ?v3 ?v10)
             (pred_9 ?v4 ?v3 )
	     (pred_3 ?v3)
             (pred_8 ?v9)
             (pred_2 ?v8)
             (pred_10 ?v10)
             (pred_12 ?v3)
             (pred_11 ?v8)
             (pred_4 ?v3)
             (pred_1 ))



(:action op_5
:parameters (?v2 ?v11 ?v5 ?v7)
:precondition (and (pred_8 ?v2) (pred_8 ?v11) (pred_2 ?v5) (pred_10 ?v7)
          (pred_5 ?v2 ?v11) (pred_6 ?v5 ?v7)
                   (pred_7 ?v11 ?v7) (pred_3 ?v2) 
                   (pred_12 ?v11) (pred_11 ?v5))
:effect (and  (pred_4 ?v11) (not (pred_12 ?v11))))


(:action op_1
:parameters (?v2 ?v1)
:precondition (and (pred_8 ?v2) (pred_8 ?v1)
               (pred_3 ?v2) (pred_5 ?v2 ?v1) (pred_4 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v2))))

(:action op_4
:parameters (?v2 ?v5)
:precondition (and (pred_8 ?v2) (pred_2 ?v5) 
                  (pred_3 ?v2) (pred_9 ?v5 ?v2) (pred_1 ))
:effect (and (pred_11 ?v5)
   (not (pred_9 ?v5 ?v2)) (not (pred_1 ))))


(:action op_3
:parameters (?v2 ?v6 ?v12)
:precondition (and (pred_8 ?v2) (pred_2 ?v6) (pred_2 ?v12)
                  (pred_3 ?v2) (pred_11 ?v12) (pred_9 ?v6 ?v2))
:effect (and (pred_11 ?v6) (pred_9 ?v12 ?v2)
        (not (pred_11 ?v12)) (not (pred_9 ?v6 ?v2))))

(:action op_2
:parameters (?v2 ?v5)
:precondition (and (pred_8 ?v2) (pred_2 ?v5) 
                  (pred_3 ?v2) (pred_11 ?v5))
:effect (and (pred_1 ) (pred_9 ?v5 ?v2) (not (pred_11 ?v5)))))


	
