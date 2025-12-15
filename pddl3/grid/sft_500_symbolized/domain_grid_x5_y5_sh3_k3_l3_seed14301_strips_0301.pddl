(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v9)
             (pred_9 ?v10 ?v6)
             (pred_6 ?v5 ?v6)
             (pred_1 ?v12 ?v5 )
	     (pred_12 ?v5)
             (pred_3 ?v13)
             (pred_10 ?v10)
             (pred_8 ?v6)
             (pred_5 ?v5)
             (pred_2 ?v10)
             (pred_11 ?v5)
             (pred_4 ))



(:action op_4
:parameters (?v2 ?v3 ?v11 ?v4)
:precondition (and (pred_3 ?v2) (pred_3 ?v3) (pred_10 ?v11) (pred_8 ?v4)
          (pred_7 ?v2 ?v3) (pred_9 ?v11 ?v4)
                   (pred_6 ?v3 ?v4) (pred_12 ?v2) 
                   (pred_5 ?v3) (pred_2 ?v11))
:effect (and  (pred_11 ?v3) (not (pred_5 ?v3))))


(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_3 ?v2) (pred_3 ?v1)
               (pred_12 ?v2) (pred_7 ?v2 ?v1) (pred_11 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v2))))

(:action op_5
:parameters (?v2 ?v11)
:precondition (and (pred_3 ?v2) (pred_10 ?v11) 
                  (pred_12 ?v2) (pred_1 ?v11 ?v2) (pred_4 ))
:effect (and (pred_2 ?v11)
   (not (pred_1 ?v11 ?v2)) (not (pred_4 ))))


(:action op_1
:parameters (?v2 ?v8 ?v7)
:precondition (and (pred_3 ?v2) (pred_10 ?v8) (pred_10 ?v7)
                  (pred_12 ?v2) (pred_2 ?v7) (pred_1 ?v8 ?v2))
:effect (and (pred_2 ?v8) (pred_1 ?v7 ?v2)
        (not (pred_2 ?v7)) (not (pred_1 ?v8 ?v2))))

(:action op_3
:parameters (?v2 ?v11)
:precondition (and (pred_3 ?v2) (pred_10 ?v11) 
                  (pred_12 ?v2) (pred_2 ?v11))
:effect (and (pred_4 ) (pred_1 ?v11 ?v2) (not (pred_2 ?v11)))))


	
