(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v1 ?v12)
             (pred_4 ?v11 ?v3)
             (pred_10 ?v1 ?v3)
             (pred_12 ?v7 ?v1 )
	     (pred_9 ?v1)
             (pred_6 ?v8)
             (pred_3 ?v11)
             (pred_5 ?v3)
             (pred_7 ?v1)
             (pred_2 ?v11)
             (pred_1 ?v1)
             (pred_8 ))



(:action op_3
:parameters (?v2 ?v10 ?v9 ?v6)
:precondition (and (pred_6 ?v2) (pred_6 ?v10) (pred_3 ?v9) (pred_5 ?v6)
          (pred_11 ?v2 ?v10) (pred_4 ?v9 ?v6)
                   (pred_10 ?v10 ?v6) (pred_9 ?v2) 
                   (pred_7 ?v10) (pred_2 ?v9))
:effect (and  (pred_1 ?v10) (not (pred_7 ?v10))))


(:action op_2
:parameters (?v2 ?v4)
:precondition (and (pred_6 ?v2) (pred_6 ?v4)
               (pred_9 ?v2) (pred_11 ?v2 ?v4) (pred_1 ?v4))
:effect (and (pred_9 ?v4) (not (pred_9 ?v2))))

(:action op_5
:parameters (?v2 ?v9)
:precondition (and (pred_6 ?v2) (pred_3 ?v9) 
                  (pred_9 ?v2) (pred_12 ?v9 ?v2) (pred_8 ))
:effect (and (pred_2 ?v9)
   (not (pred_12 ?v9 ?v2)) (not (pred_8 ))))


(:action op_4
:parameters (?v2 ?v13 ?v5)
:precondition (and (pred_6 ?v2) (pred_3 ?v13) (pred_3 ?v5)
                  (pred_9 ?v2) (pred_2 ?v5) (pred_12 ?v13 ?v2))
:effect (and (pred_2 ?v13) (pred_12 ?v5 ?v2)
        (not (pred_2 ?v5)) (not (pred_12 ?v13 ?v2))))

(:action op_1
:parameters (?v2 ?v9)
:precondition (and (pred_6 ?v2) (pred_3 ?v9) 
                  (pred_9 ?v2) (pred_2 ?v9))
:effect (and (pred_8 ) (pred_12 ?v9 ?v2) (not (pred_2 ?v9)))))


	
