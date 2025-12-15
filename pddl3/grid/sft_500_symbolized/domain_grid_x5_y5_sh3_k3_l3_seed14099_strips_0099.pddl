(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v1 ?v6)
             (pred_12 ?v8 ?v5)
             (pred_1 ?v1 ?v5)
             (pred_6 ?v13 ?v1 )
	     (pred_2 ?v1)
             (pred_4 ?v7)
             (pred_11 ?v8)
             (pred_7 ?v5)
             (pred_3 ?v1)
             (pred_10 ?v8)
             (pred_8 ?v1)
             (pred_9 ))



(:action op_3
:parameters (?v2 ?v11 ?v3 ?v9)
:precondition (and (pred_4 ?v2) (pred_4 ?v11) (pred_11 ?v3) (pred_7 ?v9)
          (pred_5 ?v2 ?v11) (pred_12 ?v3 ?v9)
                   (pred_1 ?v11 ?v9) (pred_2 ?v2) 
                   (pred_3 ?v11) (pred_10 ?v3))
:effect (and  (pred_8 ?v11) (not (pred_3 ?v11))))


(:action op_4
:parameters (?v2 ?v10)
:precondition (and (pred_4 ?v2) (pred_4 ?v10)
               (pred_2 ?v2) (pred_5 ?v2 ?v10) (pred_8 ?v10))
:effect (and (pred_2 ?v10) (not (pred_2 ?v2))))

(:action op_2
:parameters (?v2 ?v3)
:precondition (and (pred_4 ?v2) (pred_11 ?v3) 
                  (pred_2 ?v2) (pred_6 ?v3 ?v2) (pred_9 ))
:effect (and (pred_10 ?v3)
   (not (pred_6 ?v3 ?v2)) (not (pred_9 ))))


(:action op_1
:parameters (?v2 ?v12 ?v4)
:precondition (and (pred_4 ?v2) (pred_11 ?v12) (pred_11 ?v4)
                  (pred_2 ?v2) (pred_10 ?v4) (pred_6 ?v12 ?v2))
:effect (and (pred_10 ?v12) (pred_6 ?v4 ?v2)
        (not (pred_10 ?v4)) (not (pred_6 ?v12 ?v2))))

(:action op_5
:parameters (?v2 ?v3)
:precondition (and (pred_4 ?v2) (pred_11 ?v3) 
                  (pred_2 ?v2) (pred_10 ?v3))
:effect (and (pred_9 ) (pred_6 ?v3 ?v2) (not (pred_10 ?v3)))))


	
