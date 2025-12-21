(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v6 ?v9)
             (pred_4 ?v5 ?v1)
             (pred_1 ?v6 ?v1)
             (pred_8 ?v7 ?v6 )
	     (pred_2 ?v6)
             (pred_10 ?v11)
             (pred_11 ?v5)
             (pred_7 ?v1)
             (pred_6 ?v6)
             (pred_12 ?v5)
             (pred_9 ?v6)
             (pred_3 ))



(:action op_5
:parameters (?v2 ?v13 ?v3 ?v10)
:precondition (and (pred_10 ?v2) (pred_10 ?v13) (pred_11 ?v3) (pred_7 ?v10)
          (pred_5 ?v2 ?v13) (pred_4 ?v3 ?v10)
                   (pred_1 ?v13 ?v10) (pred_2 ?v2) 
                   (pred_6 ?v13) (pred_12 ?v3))
:effect (and  (pred_9 ?v13) (not (pred_6 ?v13))))


(:action op_2
:parameters (?v2 ?v8)
:precondition (and (pred_10 ?v2) (pred_10 ?v8)
               (pred_2 ?v2) (pred_5 ?v2 ?v8) (pred_9 ?v8))
:effect (and (pred_2 ?v8) (not (pred_2 ?v2))))

(:action op_4
:parameters (?v2 ?v3)
:precondition (and (pred_10 ?v2) (pred_11 ?v3) 
                  (pred_2 ?v2) (pred_8 ?v3 ?v2) (pred_3 ))
:effect (and (pred_12 ?v3)
   (not (pred_8 ?v3 ?v2)) (not (pred_3 ))))


(:action op_3
:parameters (?v2 ?v4 ?v12)
:precondition (and (pred_10 ?v2) (pred_11 ?v4) (pred_11 ?v12)
                  (pred_2 ?v2) (pred_12 ?v12) (pred_8 ?v4 ?v2))
:effect (and (pred_12 ?v4) (pred_8 ?v12 ?v2)
        (not (pred_12 ?v12)) (not (pred_8 ?v4 ?v2))))

(:action op_1
:parameters (?v2 ?v3)
:precondition (and (pred_10 ?v2) (pred_11 ?v3) 
                  (pred_2 ?v2) (pred_12 ?v3))
:effect (and (pred_3 ) (pred_8 ?v3 ?v2) (not (pred_12 ?v3)))))


	
