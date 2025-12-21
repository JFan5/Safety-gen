(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v11)
             (pred_3 ?v10 ?v4)
             (pred_5 ?v9 ?v4)
             (pred_9 ?v7 ?v9 )
	     (pred_12 ?v9)
             (pred_7 ?v2)
             (pred_8 ?v10)
             (pred_6 ?v4)
             (pred_4 ?v9)
             (pred_2 ?v10)
             (pred_1 ?v9)
             (pred_10 ))



(:action op_2
:parameters (?v12 ?v6 ?v13 ?v5)
:precondition (and (pred_7 ?v12) (pred_7 ?v6) (pred_8 ?v13) (pred_6 ?v5)
          (pred_11 ?v12 ?v6) (pred_3 ?v13 ?v5)
                   (pred_5 ?v6 ?v5) (pred_12 ?v12) 
                   (pred_4 ?v6) (pred_2 ?v13))
:effect (and  (pred_1 ?v6) (not (pred_4 ?v6))))


(:action op_4
:parameters (?v12 ?v1)
:precondition (and (pred_7 ?v12) (pred_7 ?v1)
               (pred_12 ?v12) (pred_11 ?v12 ?v1) (pred_1 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v12))))

(:action op_5
:parameters (?v12 ?v13)
:precondition (and (pred_7 ?v12) (pred_8 ?v13) 
                  (pred_12 ?v12) (pred_9 ?v13 ?v12) (pred_10 ))
:effect (and (pred_2 ?v13)
   (not (pred_9 ?v13 ?v12)) (not (pred_10 ))))


(:action op_3
:parameters (?v12 ?v3 ?v8)
:precondition (and (pred_7 ?v12) (pred_8 ?v3) (pred_8 ?v8)
                  (pred_12 ?v12) (pred_2 ?v8) (pred_9 ?v3 ?v12))
:effect (and (pred_2 ?v3) (pred_9 ?v8 ?v12)
        (not (pred_2 ?v8)) (not (pred_9 ?v3 ?v12))))

(:action op_1
:parameters (?v12 ?v13)
:precondition (and (pred_7 ?v12) (pred_8 ?v13) 
                  (pred_12 ?v12) (pred_2 ?v13))
:effect (and (pred_10 ) (pred_9 ?v13 ?v12) (not (pred_2 ?v13)))))


	
