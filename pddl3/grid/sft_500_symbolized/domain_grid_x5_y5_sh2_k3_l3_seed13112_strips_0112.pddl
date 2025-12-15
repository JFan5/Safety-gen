(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v7 ?v13)
             (pred_6 ?v2 ?v4)
             (pred_7 ?v7 ?v4)
             (pred_10 ?v8 ?v7 )
	     (pred_5 ?v7)
             (pred_12 ?v12)
             (pred_4 ?v2)
             (pred_1 ?v4)
             (pred_8 ?v7)
             (pred_2 ?v2)
             (pred_3 ?v7)
             (pred_9 ))



(:action op_3
:parameters (?v9 ?v1 ?v3 ?v6)
:precondition (and (pred_12 ?v9) (pred_12 ?v1) (pred_4 ?v3) (pred_1 ?v6)
          (pred_11 ?v9 ?v1) (pred_6 ?v3 ?v6)
                   (pred_7 ?v1 ?v6) (pred_5 ?v9) 
                   (pred_8 ?v1) (pred_2 ?v3))
:effect (and  (pred_3 ?v1) (not (pred_8 ?v1))))


(:action op_2
:parameters (?v9 ?v5)
:precondition (and (pred_12 ?v9) (pred_12 ?v5)
               (pred_5 ?v9) (pred_11 ?v9 ?v5) (pred_3 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v9))))

(:action op_5
:parameters (?v9 ?v3)
:precondition (and (pred_12 ?v9) (pred_4 ?v3) 
                  (pred_5 ?v9) (pred_10 ?v3 ?v9) (pred_9 ))
:effect (and (pred_2 ?v3)
   (not (pred_10 ?v3 ?v9)) (not (pred_9 ))))


(:action op_1
:parameters (?v9 ?v11 ?v10)
:precondition (and (pred_12 ?v9) (pred_4 ?v11) (pred_4 ?v10)
                  (pred_5 ?v9) (pred_2 ?v10) (pred_10 ?v11 ?v9))
:effect (and (pred_2 ?v11) (pred_10 ?v10 ?v9)
        (not (pred_2 ?v10)) (not (pred_10 ?v11 ?v9))))

(:action op_4
:parameters (?v9 ?v3)
:precondition (and (pred_12 ?v9) (pred_4 ?v3) 
                  (pred_5 ?v9) (pred_2 ?v3))
:effect (and (pred_9 ) (pred_10 ?v3 ?v9) (not (pred_2 ?v3)))))


	
