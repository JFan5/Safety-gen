(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v12 ?v10)
             (pred_10 ?v7 ?v4)
             (pred_5 ?v12 ?v4)
             (pred_7 ?v2 ?v12 )
	     (pred_9 ?v12)
             (pred_3 ?v5)
             (pred_1 ?v7)
             (pred_11 ?v4)
             (pred_6 ?v12)
             (pred_2 ?v7)
             (pred_8 ?v12)
             (pred_12 ))



(:action op_3
:parameters (?v1 ?v9 ?v11 ?v3)
:precondition (and (pred_3 ?v1) (pred_3 ?v9) (pred_1 ?v11) (pred_11 ?v3)
          (pred_4 ?v1 ?v9) (pred_10 ?v11 ?v3)
                   (pred_5 ?v9 ?v3) (pred_9 ?v1) 
                   (pred_6 ?v9) (pred_2 ?v11))
:effect (and  (pred_8 ?v9) (not (pred_6 ?v9))))


(:action op_4
:parameters (?v1 ?v8)
:precondition (and (pred_3 ?v1) (pred_3 ?v8)
               (pred_9 ?v1) (pred_4 ?v1 ?v8) (pred_8 ?v8))
:effect (and (pred_9 ?v8) (not (pred_9 ?v1))))

(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_3 ?v1) (pred_1 ?v11) 
                  (pred_9 ?v1) (pred_7 ?v11 ?v1) (pred_12 ))
:effect (and (pred_2 ?v11)
   (not (pred_7 ?v11 ?v1)) (not (pred_12 ))))


(:action op_1
:parameters (?v1 ?v13 ?v6)
:precondition (and (pred_3 ?v1) (pred_1 ?v13) (pred_1 ?v6)
                  (pred_9 ?v1) (pred_2 ?v6) (pred_7 ?v13 ?v1))
:effect (and (pred_2 ?v13) (pred_7 ?v6 ?v1)
        (not (pred_2 ?v6)) (not (pred_7 ?v13 ?v1))))

(:action op_2
:parameters (?v1 ?v11)
:precondition (and (pred_3 ?v1) (pred_1 ?v11) 
                  (pred_9 ?v1) (pred_2 ?v11))
:effect (and (pred_12 ) (pred_7 ?v11 ?v1) (not (pred_2 ?v11)))))


	
