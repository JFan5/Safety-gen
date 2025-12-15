(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v7)
             (pred_6 ?v12 ?v5)
             (pred_12 ?v13 ?v5)
             (pred_1 ?v9 ?v13 )
	     (pred_4 ?v13)
             (pred_3 ?v2)
             (pred_8 ?v12)
             (pred_10 ?v5)
             (pred_5 ?v13)
             (pred_9 ?v12)
             (pred_11 ?v13)
             (pred_7 ))



(:action op_1
:parameters (?v1 ?v10 ?v11 ?v4)
:precondition (and (pred_3 ?v1) (pred_3 ?v10) (pred_8 ?v11) (pred_10 ?v4)
          (pred_2 ?v1 ?v10) (pred_6 ?v11 ?v4)
                   (pred_12 ?v10 ?v4) (pred_4 ?v1) 
                   (pred_5 ?v10) (pred_9 ?v11))
:effect (and  (pred_11 ?v10) (not (pred_5 ?v10))))


(:action op_3
:parameters (?v1 ?v3)
:precondition (and (pred_3 ?v1) (pred_3 ?v3)
               (pred_4 ?v1) (pred_2 ?v1 ?v3) (pred_11 ?v3))
:effect (and (pred_4 ?v3) (not (pred_4 ?v1))))

(:action op_4
:parameters (?v1 ?v11)
:precondition (and (pred_3 ?v1) (pred_8 ?v11) 
                  (pred_4 ?v1) (pred_1 ?v11 ?v1) (pred_7 ))
:effect (and (pred_9 ?v11)
   (not (pred_1 ?v11 ?v1)) (not (pred_7 ))))


(:action op_2
:parameters (?v1 ?v6 ?v8)
:precondition (and (pred_3 ?v1) (pred_8 ?v6) (pred_8 ?v8)
                  (pred_4 ?v1) (pred_9 ?v8) (pred_1 ?v6 ?v1))
:effect (and (pred_9 ?v6) (pred_1 ?v8 ?v1)
        (not (pred_9 ?v8)) (not (pred_1 ?v6 ?v1))))

(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_3 ?v1) (pred_8 ?v11) 
                  (pred_4 ?v1) (pred_9 ?v11))
:effect (and (pred_7 ) (pred_1 ?v11 ?v1) (not (pred_9 ?v11)))))


	
