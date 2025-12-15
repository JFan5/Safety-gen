(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v9 ?v12)
             (pred_1 ?v8 ?v5)
             (pred_12 ?v9 ?v5)
             (pred_10 ?v10 ?v9 )
	     (pred_11 ?v9)
             (pred_9 ?v6)
             (pred_7 ?v8)
             (pred_5 ?v5)
             (pred_3 ?v9)
             (pred_6 ?v8)
             (pred_8 ?v9)
             (pred_2 ))



(:action op_1
:parameters (?v2 ?v13 ?v1 ?v4)
:precondition (and (pred_9 ?v2) (pred_9 ?v13) (pred_7 ?v1) (pred_5 ?v4)
          (pred_4 ?v2 ?v13) (pred_1 ?v1 ?v4)
                   (pred_12 ?v13 ?v4) (pred_11 ?v2) 
                   (pred_3 ?v13) (pred_6 ?v1))
:effect (and  (pred_8 ?v13) (not (pred_3 ?v13))))


(:action op_4
:parameters (?v2 ?v11)
:precondition (and (pred_9 ?v2) (pred_9 ?v11)
               (pred_11 ?v2) (pred_4 ?v2 ?v11) (pred_8 ?v11))
:effect (and (pred_11 ?v11) (not (pred_11 ?v2))))

(:action op_3
:parameters (?v2 ?v1)
:precondition (and (pred_9 ?v2) (pred_7 ?v1) 
                  (pred_11 ?v2) (pred_10 ?v1 ?v2) (pred_2 ))
:effect (and (pred_6 ?v1)
   (not (pred_10 ?v1 ?v2)) (not (pred_2 ))))


(:action op_5
:parameters (?v2 ?v3 ?v7)
:precondition (and (pred_9 ?v2) (pred_7 ?v3) (pred_7 ?v7)
                  (pred_11 ?v2) (pred_6 ?v7) (pred_10 ?v3 ?v2))
:effect (and (pred_6 ?v3) (pred_10 ?v7 ?v2)
        (not (pred_6 ?v7)) (not (pred_10 ?v3 ?v2))))

(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_9 ?v2) (pred_7 ?v1) 
                  (pred_11 ?v2) (pred_6 ?v1))
:effect (and (pred_2 ) (pred_10 ?v1 ?v2) (not (pred_6 ?v1)))))


	
