(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v9 ?v2)
             (pred_4 ?v7 ?v12)
             (pred_8 ?v9 ?v12)
             (pred_2 ?v11 ?v9 )
	     (pred_5 ?v9)
             (pred_3 ?v6)
             (pred_6 ?v7)
             (pred_7 ?v12)
             (pred_12 ?v9)
             (pred_9 ?v7)
             (pred_10 ?v9)
             (pred_1 ))



(:action op_2
:parameters (?v10 ?v8 ?v1 ?v4)
:precondition (and (pred_3 ?v10) (pred_3 ?v8) (pred_6 ?v1) (pred_7 ?v4)
          (pred_11 ?v10 ?v8) (pred_4 ?v1 ?v4)
                   (pred_8 ?v8 ?v4) (pred_5 ?v10) 
                   (pred_12 ?v8) (pred_9 ?v1))
:effect (and  (pred_10 ?v8) (not (pred_12 ?v8))))


(:action op_5
:parameters (?v10 ?v3)
:precondition (and (pred_3 ?v10) (pred_3 ?v3)
               (pred_5 ?v10) (pred_11 ?v10 ?v3) (pred_10 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v10))))

(:action op_3
:parameters (?v10 ?v1)
:precondition (and (pred_3 ?v10) (pred_6 ?v1) 
                  (pred_5 ?v10) (pred_2 ?v1 ?v10) (pred_1 ))
:effect (and (pred_9 ?v1)
   (not (pred_2 ?v1 ?v10)) (not (pred_1 ))))


(:action op_1
:parameters (?v10 ?v5 ?v13)
:precondition (and (pred_3 ?v10) (pred_6 ?v5) (pred_6 ?v13)
                  (pred_5 ?v10) (pred_9 ?v13) (pred_2 ?v5 ?v10))
:effect (and (pred_9 ?v5) (pred_2 ?v13 ?v10)
        (not (pred_9 ?v13)) (not (pred_2 ?v5 ?v10))))

(:action op_4
:parameters (?v10 ?v1)
:precondition (and (pred_3 ?v10) (pred_6 ?v1) 
                  (pred_5 ?v10) (pred_9 ?v1))
:effect (and (pred_1 ) (pred_2 ?v1 ?v10) (not (pred_9 ?v1)))))


	
