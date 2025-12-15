(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v4)
             (pred_11 ?v3 ?v10)
             (pred_4 ?v11 ?v10)
             (pred_5 ?v5 ?v11 )
	     (pred_12 ?v11)
             (pred_9 ?v6)
             (pred_2 ?v3)
             (pred_3 ?v10)
             (pred_7 ?v11)
             (pred_10 ?v3)
             (pred_6 ?v11)
             (pred_8 ))



(:action op_5
:parameters (?v8 ?v12 ?v13 ?v7)
:precondition (and (pred_9 ?v8) (pred_9 ?v12) (pred_2 ?v13) (pred_3 ?v7)
          (pred_1 ?v8 ?v12) (pred_11 ?v13 ?v7)
                   (pred_4 ?v12 ?v7) (pred_12 ?v8) 
                   (pred_7 ?v12) (pred_10 ?v13))
:effect (and  (pred_6 ?v12) (not (pred_7 ?v12))))


(:action op_3
:parameters (?v8 ?v9)
:precondition (and (pred_9 ?v8) (pred_9 ?v9)
               (pred_12 ?v8) (pred_1 ?v8 ?v9) (pred_6 ?v9))
:effect (and (pred_12 ?v9) (not (pred_12 ?v8))))

(:action op_1
:parameters (?v8 ?v13)
:precondition (and (pred_9 ?v8) (pred_2 ?v13) 
                  (pred_12 ?v8) (pred_5 ?v13 ?v8) (pred_8 ))
:effect (and (pred_10 ?v13)
   (not (pred_5 ?v13 ?v8)) (not (pred_8 ))))


(:action op_4
:parameters (?v8 ?v1 ?v2)
:precondition (and (pred_9 ?v8) (pred_2 ?v1) (pred_2 ?v2)
                  (pred_12 ?v8) (pred_10 ?v2) (pred_5 ?v1 ?v8))
:effect (and (pred_10 ?v1) (pred_5 ?v2 ?v8)
        (not (pred_10 ?v2)) (not (pred_5 ?v1 ?v8))))

(:action op_2
:parameters (?v8 ?v13)
:precondition (and (pred_9 ?v8) (pred_2 ?v13) 
                  (pred_12 ?v8) (pred_10 ?v13))
:effect (and (pred_8 ) (pred_5 ?v13 ?v8) (not (pred_10 ?v13)))))


	
