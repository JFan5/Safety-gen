(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v2 ?v13)
             (pred_11 ?v10 ?v3)
             (pred_7 ?v2 ?v3)
             (pred_2 ?v5 ?v2 )
	     (pred_10 ?v2)
             (pred_9 ?v8)
             (pred_12 ?v10)
             (pred_8 ?v3)
             (pred_4 ?v2)
             (pred_6 ?v10)
             (pred_3 ?v2)
             (pred_1 ))



(:action op_2
:parameters (?v9 ?v12 ?v1 ?v7)
:precondition (and (pred_9 ?v9) (pred_9 ?v12) (pred_12 ?v1) (pred_8 ?v7)
          (pred_5 ?v9 ?v12) (pred_11 ?v1 ?v7)
                   (pred_7 ?v12 ?v7) (pred_10 ?v9) 
                   (pred_4 ?v12) (pred_6 ?v1))
:effect (and  (pred_3 ?v12) (not (pred_4 ?v12))))


(:action op_5
:parameters (?v9 ?v6)
:precondition (and (pred_9 ?v9) (pred_9 ?v6)
               (pred_10 ?v9) (pred_5 ?v9 ?v6) (pred_3 ?v6))
:effect (and (pred_10 ?v6) (not (pred_10 ?v9))))

(:action op_1
:parameters (?v9 ?v1)
:precondition (and (pred_9 ?v9) (pred_12 ?v1) 
                  (pred_10 ?v9) (pred_2 ?v1 ?v9) (pred_1 ))
:effect (and (pred_6 ?v1)
   (not (pred_2 ?v1 ?v9)) (not (pred_1 ))))


(:action op_3
:parameters (?v9 ?v11 ?v4)
:precondition (and (pred_9 ?v9) (pred_12 ?v11) (pred_12 ?v4)
                  (pred_10 ?v9) (pred_6 ?v4) (pred_2 ?v11 ?v9))
:effect (and (pred_6 ?v11) (pred_2 ?v4 ?v9)
        (not (pred_6 ?v4)) (not (pred_2 ?v11 ?v9))))

(:action op_4
:parameters (?v9 ?v1)
:precondition (and (pred_9 ?v9) (pred_12 ?v1) 
                  (pred_10 ?v9) (pred_6 ?v1))
:effect (and (pred_1 ) (pred_2 ?v1 ?v9) (not (pred_6 ?v1)))))


	
