(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v10 ?v12)
             (pred_8 ?v1 ?v11)
             (pred_1 ?v10 ?v11)
             (pred_10 ?v7 ?v10 )
	     (pred_12 ?v10)
             (pred_2 ?v5)
             (pred_11 ?v1)
             (pred_6 ?v11)
             (pred_7 ?v10)
             (pred_3 ?v1)
             (pred_4 ?v10)
             (pred_5 ))



(:action op_1
:parameters (?v8 ?v6 ?v2 ?v4)
:precondition (and (pred_2 ?v8) (pred_2 ?v6) (pred_11 ?v2) (pred_6 ?v4)
          (pred_9 ?v8 ?v6) (pred_8 ?v2 ?v4)
                   (pred_1 ?v6 ?v4) (pred_12 ?v8) 
                   (pred_7 ?v6) (pred_3 ?v2))
:effect (and  (pred_4 ?v6) (not (pred_7 ?v6))))


(:action op_2
:parameters (?v8 ?v3)
:precondition (and (pred_2 ?v8) (pred_2 ?v3)
               (pred_12 ?v8) (pred_9 ?v8 ?v3) (pred_4 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v8))))

(:action op_4
:parameters (?v8 ?v2)
:precondition (and (pred_2 ?v8) (pred_11 ?v2) 
                  (pred_12 ?v8) (pred_10 ?v2 ?v8) (pred_5 ))
:effect (and (pred_3 ?v2)
   (not (pred_10 ?v2 ?v8)) (not (pred_5 ))))


(:action op_3
:parameters (?v8 ?v9 ?v13)
:precondition (and (pred_2 ?v8) (pred_11 ?v9) (pred_11 ?v13)
                  (pred_12 ?v8) (pred_3 ?v13) (pred_10 ?v9 ?v8))
:effect (and (pred_3 ?v9) (pred_10 ?v13 ?v8)
        (not (pred_3 ?v13)) (not (pred_10 ?v9 ?v8))))

(:action op_5
:parameters (?v8 ?v2)
:precondition (and (pred_2 ?v8) (pred_11 ?v2) 
                  (pred_12 ?v8) (pred_3 ?v2))
:effect (and (pred_5 ) (pred_10 ?v2 ?v8) (not (pred_3 ?v2)))))


	
