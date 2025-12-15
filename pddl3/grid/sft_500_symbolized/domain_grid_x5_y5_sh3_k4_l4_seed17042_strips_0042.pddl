(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v10 ?v12)
             (pred_10 ?v8 ?v4)
             (pred_6 ?v10 ?v4)
             (pred_11 ?v9 ?v10 )
	     (pred_9 ?v10)
             (pred_5 ?v1)
             (pred_8 ?v8)
             (pred_12 ?v4)
             (pred_7 ?v10)
             (pred_2 ?v8)
             (pred_4 ?v10)
             (pred_3 ))



(:action op_2
:parameters (?v2 ?v3 ?v7 ?v13)
:precondition (and (pred_5 ?v2) (pred_5 ?v3) (pred_8 ?v7) (pred_12 ?v13)
          (pred_1 ?v2 ?v3) (pred_10 ?v7 ?v13)
                   (pred_6 ?v3 ?v13) (pred_9 ?v2) 
                   (pred_7 ?v3) (pred_2 ?v7))
:effect (and  (pred_4 ?v3) (not (pred_7 ?v3))))


(:action op_5
:parameters (?v2 ?v11)
:precondition (and (pred_5 ?v2) (pred_5 ?v11)
               (pred_9 ?v2) (pred_1 ?v2 ?v11) (pred_4 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v2))))

(:action op_4
:parameters (?v2 ?v7)
:precondition (and (pred_5 ?v2) (pred_8 ?v7) 
                  (pred_9 ?v2) (pred_11 ?v7 ?v2) (pred_3 ))
:effect (and (pred_2 ?v7)
   (not (pred_11 ?v7 ?v2)) (not (pred_3 ))))


(:action op_1
:parameters (?v2 ?v6 ?v5)
:precondition (and (pred_5 ?v2) (pred_8 ?v6) (pred_8 ?v5)
                  (pred_9 ?v2) (pred_2 ?v5) (pred_11 ?v6 ?v2))
:effect (and (pred_2 ?v6) (pred_11 ?v5 ?v2)
        (not (pred_2 ?v5)) (not (pred_11 ?v6 ?v2))))

(:action op_3
:parameters (?v2 ?v7)
:precondition (and (pred_5 ?v2) (pred_8 ?v7) 
                  (pred_9 ?v2) (pred_2 ?v7))
:effect (and (pred_3 ) (pred_11 ?v7 ?v2) (not (pred_2 ?v7)))))


	
