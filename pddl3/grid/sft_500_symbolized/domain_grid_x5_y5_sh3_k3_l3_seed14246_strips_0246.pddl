(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v6)
             (pred_9 ?v13 ?v12)
             (pred_7 ?v10 ?v12)
             (pred_1 ?v8 ?v10 )
	     (pred_10 ?v10)
             (pred_2 ?v4)
             (pred_11 ?v13)
             (pred_12 ?v12)
             (pred_6 ?v10)
             (pred_5 ?v13)
             (pred_8 ?v10)
             (pred_3 ))



(:action op_3
:parameters (?v9 ?v1 ?v7 ?v2)
:precondition (and (pred_2 ?v9) (pred_2 ?v1) (pred_11 ?v7) (pred_12 ?v2)
          (pred_4 ?v9 ?v1) (pred_9 ?v7 ?v2)
                   (pred_7 ?v1 ?v2) (pred_10 ?v9) 
                   (pred_6 ?v1) (pred_5 ?v7))
:effect (and  (pred_8 ?v1) (not (pred_6 ?v1))))


(:action op_1
:parameters (?v9 ?v5)
:precondition (and (pred_2 ?v9) (pred_2 ?v5)
               (pred_10 ?v9) (pred_4 ?v9 ?v5) (pred_8 ?v5))
:effect (and (pred_10 ?v5) (not (pred_10 ?v9))))

(:action op_5
:parameters (?v9 ?v7)
:precondition (and (pred_2 ?v9) (pred_11 ?v7) 
                  (pred_10 ?v9) (pred_1 ?v7 ?v9) (pred_3 ))
:effect (and (pred_5 ?v7)
   (not (pred_1 ?v7 ?v9)) (not (pred_3 ))))


(:action op_2
:parameters (?v9 ?v11 ?v3)
:precondition (and (pred_2 ?v9) (pred_11 ?v11) (pred_11 ?v3)
                  (pred_10 ?v9) (pred_5 ?v3) (pred_1 ?v11 ?v9))
:effect (and (pred_5 ?v11) (pred_1 ?v3 ?v9)
        (not (pred_5 ?v3)) (not (pred_1 ?v11 ?v9))))

(:action op_4
:parameters (?v9 ?v7)
:precondition (and (pred_2 ?v9) (pred_11 ?v7) 
                  (pred_10 ?v9) (pred_5 ?v7))
:effect (and (pred_3 ) (pred_1 ?v7 ?v9) (not (pred_5 ?v7)))))


	
