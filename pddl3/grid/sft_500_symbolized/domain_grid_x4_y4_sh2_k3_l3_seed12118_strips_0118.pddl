(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v6 ?v7)
             (pred_4 ?v4 ?v10)
             (pred_7 ?v6 ?v10)
             (pred_6 ?v5 ?v6 )
	     (pred_12 ?v6)
             (pred_10 ?v9)
             (pred_11 ?v4)
             (pred_2 ?v10)
             (pred_1 ?v6)
             (pred_8 ?v4)
             (pred_5 ?v6)
             (pred_3 ))



(:action op_5
:parameters (?v1 ?v8 ?v11 ?v12)
:precondition (and (pred_10 ?v1) (pred_10 ?v8) (pred_11 ?v11) (pred_2 ?v12)
          (pred_9 ?v1 ?v8) (pred_4 ?v11 ?v12)
                   (pred_7 ?v8 ?v12) (pred_12 ?v1) 
                   (pred_1 ?v8) (pred_8 ?v11))
:effect (and  (pred_5 ?v8) (not (pred_1 ?v8))))


(:action op_3
:parameters (?v1 ?v2)
:precondition (and (pred_10 ?v1) (pred_10 ?v2)
               (pred_12 ?v1) (pred_9 ?v1 ?v2) (pred_5 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v1))))

(:action op_1
:parameters (?v1 ?v11)
:precondition (and (pred_10 ?v1) (pred_11 ?v11) 
                  (pred_12 ?v1) (pred_6 ?v11 ?v1) (pred_3 ))
:effect (and (pred_8 ?v11)
   (not (pred_6 ?v11 ?v1)) (not (pred_3 ))))


(:action op_4
:parameters (?v1 ?v13 ?v3)
:precondition (and (pred_10 ?v1) (pred_11 ?v13) (pred_11 ?v3)
                  (pred_12 ?v1) (pred_8 ?v3) (pred_6 ?v13 ?v1))
:effect (and (pred_8 ?v13) (pred_6 ?v3 ?v1)
        (not (pred_8 ?v3)) (not (pred_6 ?v13 ?v1))))

(:action op_2
:parameters (?v1 ?v11)
:precondition (and (pred_10 ?v1) (pred_11 ?v11) 
                  (pred_12 ?v1) (pred_8 ?v11))
:effect (and (pred_3 ) (pred_6 ?v11 ?v1) (not (pred_8 ?v11)))))


	
