(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v3 ?v8)
             (pred_11 ?v6 ?v13)
             (pred_7 ?v3 ?v13)
             (pred_4 ?v4 ?v3 )
	     (pred_1 ?v3)
             (pred_6 ?v12)
             (pred_12 ?v6)
             (pred_2 ?v13)
             (pred_3 ?v3)
             (pred_8 ?v6)
             (pred_9 ?v3)
             (pred_10 ))



(:action op_4
:parameters (?v2 ?v10 ?v1 ?v7)
:precondition (and (pred_6 ?v2) (pred_6 ?v10) (pred_12 ?v1) (pred_2 ?v7)
          (pred_5 ?v2 ?v10) (pred_11 ?v1 ?v7)
                   (pred_7 ?v10 ?v7) (pred_1 ?v2) 
                   (pred_3 ?v10) (pred_8 ?v1))
:effect (and  (pred_9 ?v10) (not (pred_3 ?v10))))


(:action op_1
:parameters (?v2 ?v11)
:precondition (and (pred_6 ?v2) (pred_6 ?v11)
               (pred_1 ?v2) (pred_5 ?v2 ?v11) (pred_9 ?v11))
:effect (and (pred_1 ?v11) (not (pred_1 ?v2))))

(:action op_3
:parameters (?v2 ?v1)
:precondition (and (pred_6 ?v2) (pred_12 ?v1) 
                  (pred_1 ?v2) (pred_4 ?v1 ?v2) (pred_10 ))
:effect (and (pred_8 ?v1)
   (not (pred_4 ?v1 ?v2)) (not (pred_10 ))))


(:action op_5
:parameters (?v2 ?v5 ?v9)
:precondition (and (pred_6 ?v2) (pred_12 ?v5) (pred_12 ?v9)
                  (pred_1 ?v2) (pred_8 ?v9) (pred_4 ?v5 ?v2))
:effect (and (pred_8 ?v5) (pred_4 ?v9 ?v2)
        (not (pred_8 ?v9)) (not (pred_4 ?v5 ?v2))))

(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_6 ?v2) (pred_12 ?v1) 
                  (pred_1 ?v2) (pred_8 ?v1))
:effect (and (pred_10 ) (pred_4 ?v1 ?v2) (not (pred_8 ?v1)))))


	
