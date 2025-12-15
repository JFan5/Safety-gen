(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v13 ?v1)
             (pred_5 ?v3 ?v6)
             (pred_3 ?v13 ?v6)
             (pred_11 ?v5 ?v13 )
	     (pred_6 ?v13)
             (pred_12 ?v12)
             (pred_4 ?v3)
             (pred_9 ?v6)
             (pred_2 ?v13)
             (pred_8 ?v3)
             (pred_7 ?v13)
             (pred_10 ))



(:action op_1
:parameters (?v2 ?v10 ?v4 ?v7)
:precondition (and (pred_12 ?v2) (pred_12 ?v10) (pred_4 ?v4) (pred_9 ?v7)
          (pred_1 ?v2 ?v10) (pred_5 ?v4 ?v7)
                   (pred_3 ?v10 ?v7) (pred_6 ?v2) 
                   (pred_2 ?v10) (pred_8 ?v4))
:effect (and  (pred_7 ?v10) (not (pred_2 ?v10))))


(:action op_5
:parameters (?v2 ?v8)
:precondition (and (pred_12 ?v2) (pred_12 ?v8)
               (pred_6 ?v2) (pred_1 ?v2 ?v8) (pred_7 ?v8))
:effect (and (pred_6 ?v8) (not (pred_6 ?v2))))

(:action op_4
:parameters (?v2 ?v4)
:precondition (and (pred_12 ?v2) (pred_4 ?v4) 
                  (pred_6 ?v2) (pred_11 ?v4 ?v2) (pred_10 ))
:effect (and (pred_8 ?v4)
   (not (pred_11 ?v4 ?v2)) (not (pred_10 ))))


(:action op_2
:parameters (?v2 ?v9 ?v11)
:precondition (and (pred_12 ?v2) (pred_4 ?v9) (pred_4 ?v11)
                  (pred_6 ?v2) (pred_8 ?v11) (pred_11 ?v9 ?v2))
:effect (and (pred_8 ?v9) (pred_11 ?v11 ?v2)
        (not (pred_8 ?v11)) (not (pred_11 ?v9 ?v2))))

(:action op_3
:parameters (?v2 ?v4)
:precondition (and (pred_12 ?v2) (pred_4 ?v4) 
                  (pred_6 ?v2) (pred_8 ?v4))
:effect (and (pred_10 ) (pred_11 ?v4 ?v2) (not (pred_8 ?v4)))))


	
