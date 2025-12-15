(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v10 ?v11)
             (pred_3 ?v4 ?v5)
             (pred_2 ?v10 ?v5)
             (pred_10 ?v8 ?v10 )
	     (pred_1 ?v10)
             (pred_4 ?v7)
             (pred_12 ?v4)
             (pred_5 ?v5)
             (pred_7 ?v10)
             (pred_9 ?v4)
             (pred_8 ?v10)
             (pred_11 ))



(:action op_1
:parameters (?v12 ?v3 ?v2 ?v6)
:precondition (and (pred_4 ?v12) (pred_4 ?v3) (pred_12 ?v2) (pred_5 ?v6)
          (pred_6 ?v12 ?v3) (pred_3 ?v2 ?v6)
                   (pred_2 ?v3 ?v6) (pred_1 ?v12) 
                   (pred_7 ?v3) (pred_9 ?v2))
:effect (and  (pred_8 ?v3) (not (pred_7 ?v3))))


(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_4 ?v12) (pred_4 ?v1)
               (pred_1 ?v12) (pred_6 ?v12 ?v1) (pred_8 ?v1))
:effect (and (pred_1 ?v1) (not (pred_1 ?v12))))

(:action op_3
:parameters (?v12 ?v2)
:precondition (and (pred_4 ?v12) (pred_12 ?v2) 
                  (pred_1 ?v12) (pred_10 ?v2 ?v12) (pred_11 ))
:effect (and (pred_9 ?v2)
   (not (pred_10 ?v2 ?v12)) (not (pred_11 ))))


(:action op_2
:parameters (?v12 ?v13 ?v9)
:precondition (and (pred_4 ?v12) (pred_12 ?v13) (pred_12 ?v9)
                  (pred_1 ?v12) (pred_9 ?v9) (pred_10 ?v13 ?v12))
:effect (and (pred_9 ?v13) (pred_10 ?v9 ?v12)
        (not (pred_9 ?v9)) (not (pred_10 ?v13 ?v12))))

(:action op_4
:parameters (?v12 ?v2)
:precondition (and (pred_4 ?v12) (pred_12 ?v2) 
                  (pred_1 ?v12) (pred_9 ?v2))
:effect (and (pred_11 ) (pred_10 ?v2 ?v12) (not (pred_9 ?v2)))))


	
