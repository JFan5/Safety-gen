(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v9)
             (pred_6 ?v6 ?v8)
             (pred_1 ?v4 ?v8)
             (pred_11 ?v10 ?v4 )
	     (pred_12 ?v4)
             (pred_8 ?v5)
             (pred_2 ?v6)
             (pred_4 ?v8)
             (pred_3 ?v4)
             (pred_9 ?v6)
             (pred_10 ?v4)
             (pred_7 ))



(:action op_3
:parameters (?v12 ?v2 ?v1 ?v3)
:precondition (and (pred_8 ?v12) (pred_8 ?v2) (pred_2 ?v1) (pred_4 ?v3)
          (pred_5 ?v12 ?v2) (pred_6 ?v1 ?v3)
                   (pred_1 ?v2 ?v3) (pred_12 ?v12) 
                   (pred_3 ?v2) (pred_9 ?v1))
:effect (and  (pred_10 ?v2) (not (pred_3 ?v2))))


(:action op_1
:parameters (?v12 ?v7)
:precondition (and (pred_8 ?v12) (pred_8 ?v7)
               (pred_12 ?v12) (pred_5 ?v12 ?v7) (pred_10 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v12))))

(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_8 ?v12) (pred_2 ?v1) 
                  (pred_12 ?v12) (pred_11 ?v1 ?v12) (pred_7 ))
:effect (and (pred_9 ?v1)
   (not (pred_11 ?v1 ?v12)) (not (pred_7 ))))


(:action op_4
:parameters (?v12 ?v13 ?v11)
:precondition (and (pred_8 ?v12) (pred_2 ?v13) (pred_2 ?v11)
                  (pred_12 ?v12) (pred_9 ?v11) (pred_11 ?v13 ?v12))
:effect (and (pred_9 ?v13) (pred_11 ?v11 ?v12)
        (not (pred_9 ?v11)) (not (pred_11 ?v13 ?v12))))

(:action op_2
:parameters (?v12 ?v1)
:precondition (and (pred_8 ?v12) (pred_2 ?v1) 
                  (pred_12 ?v12) (pred_9 ?v1))
:effect (and (pred_7 ) (pred_11 ?v1 ?v12) (not (pred_9 ?v1)))))


	
