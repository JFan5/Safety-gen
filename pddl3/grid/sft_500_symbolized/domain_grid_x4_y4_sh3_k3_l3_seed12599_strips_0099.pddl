(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v3)
             (pred_9 ?v10 ?v6)
             (pred_7 ?v2 ?v6)
             (pred_3 ?v13 ?v2 )
	     (pred_1 ?v2)
             (pred_11 ?v5)
             (pred_6 ?v10)
             (pred_8 ?v6)
             (pred_2 ?v2)
             (pred_4 ?v10)
             (pred_10 ?v2)
             (pred_5 ))



(:action op_1
:parameters (?v1 ?v9 ?v7 ?v12)
:precondition (and (pred_11 ?v1) (pred_11 ?v9) (pred_6 ?v7) (pred_8 ?v12)
          (pred_12 ?v1 ?v9) (pred_9 ?v7 ?v12)
                   (pred_7 ?v9 ?v12) (pred_1 ?v1) 
                   (pred_2 ?v9) (pred_4 ?v7))
:effect (and  (pred_10 ?v9) (not (pred_2 ?v9))))


(:action op_4
:parameters (?v1 ?v11)
:precondition (and (pred_11 ?v1) (pred_11 ?v11)
               (pred_1 ?v1) (pred_12 ?v1 ?v11) (pred_10 ?v11))
:effect (and (pred_1 ?v11) (not (pred_1 ?v1))))

(:action op_3
:parameters (?v1 ?v7)
:precondition (and (pred_11 ?v1) (pred_6 ?v7) 
                  (pred_1 ?v1) (pred_3 ?v7 ?v1) (pred_5 ))
:effect (and (pred_4 ?v7)
   (not (pred_3 ?v7 ?v1)) (not (pred_5 ))))


(:action op_2
:parameters (?v1 ?v8 ?v4)
:precondition (and (pred_11 ?v1) (pred_6 ?v8) (pred_6 ?v4)
                  (pred_1 ?v1) (pred_4 ?v4) (pred_3 ?v8 ?v1))
:effect (and (pred_4 ?v8) (pred_3 ?v4 ?v1)
        (not (pred_4 ?v4)) (not (pred_3 ?v8 ?v1))))

(:action op_5
:parameters (?v1 ?v7)
:precondition (and (pred_11 ?v1) (pred_6 ?v7) 
                  (pred_1 ?v1) (pred_4 ?v7))
:effect (and (pred_5 ) (pred_3 ?v7 ?v1) (not (pred_4 ?v7)))))


	
