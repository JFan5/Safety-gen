(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v10 ?v12)
             (pred_6 ?v11 ?v5)
             (pred_7 ?v10 ?v5)
             (pred_11 ?v13 ?v10 )
	     (pred_2 ?v10)
             (pred_12 ?v3)
             (pred_8 ?v11)
             (pred_10 ?v5)
             (pred_5 ?v10)
             (pred_1 ?v11)
             (pred_4 ?v10)
             (pred_3 ))



(:action op_3
:parameters (?v9 ?v8 ?v7 ?v4)
:precondition (and (pred_12 ?v9) (pred_12 ?v8) (pred_8 ?v7) (pred_10 ?v4)
          (pred_9 ?v9 ?v8) (pred_6 ?v7 ?v4)
                   (pred_7 ?v8 ?v4) (pred_2 ?v9) 
                   (pred_5 ?v8) (pred_1 ?v7))
:effect (and  (pred_4 ?v8) (not (pred_5 ?v8))))


(:action op_4
:parameters (?v9 ?v1)
:precondition (and (pred_12 ?v9) (pred_12 ?v1)
               (pred_2 ?v9) (pred_9 ?v9 ?v1) (pred_4 ?v1))
:effect (and (pred_2 ?v1) (not (pred_2 ?v9))))

(:action op_2
:parameters (?v9 ?v7)
:precondition (and (pred_12 ?v9) (pred_8 ?v7) 
                  (pred_2 ?v9) (pred_11 ?v7 ?v9) (pred_3 ))
:effect (and (pred_1 ?v7)
   (not (pred_11 ?v7 ?v9)) (not (pred_3 ))))


(:action op_1
:parameters (?v9 ?v6 ?v2)
:precondition (and (pred_12 ?v9) (pred_8 ?v6) (pred_8 ?v2)
                  (pred_2 ?v9) (pred_1 ?v2) (pred_11 ?v6 ?v9))
:effect (and (pred_1 ?v6) (pred_11 ?v2 ?v9)
        (not (pred_1 ?v2)) (not (pred_11 ?v6 ?v9))))

(:action op_5
:parameters (?v9 ?v7)
:precondition (and (pred_12 ?v9) (pred_8 ?v7) 
                  (pred_2 ?v9) (pred_1 ?v7))
:effect (and (pred_3 ) (pred_11 ?v7 ?v9) (not (pred_1 ?v7)))))


	
