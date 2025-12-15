(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v2)
             (pred_8 ?v13 ?v3)
             (pred_3 ?v6 ?v3)
             (pred_10 ?v10 ?v6 )
	     (pred_12 ?v6)
             (pred_2 ?v4)
             (pred_1 ?v13)
             (pred_5 ?v3)
             (pred_9 ?v6)
             (pred_11 ?v13)
             (pred_6 ?v6)
             (pred_4 ))



(:action op_4
:parameters (?v9 ?v12 ?v1 ?v7)
:precondition (and (pred_2 ?v9) (pred_2 ?v12) (pred_1 ?v1) (pred_5 ?v7)
          (pred_7 ?v9 ?v12) (pred_8 ?v1 ?v7)
                   (pred_3 ?v12 ?v7) (pred_12 ?v9) 
                   (pred_9 ?v12) (pred_11 ?v1))
:effect (and  (pred_6 ?v12) (not (pred_9 ?v12))))


(:action op_1
:parameters (?v9 ?v11)
:precondition (and (pred_2 ?v9) (pred_2 ?v11)
               (pred_12 ?v9) (pred_7 ?v9 ?v11) (pred_6 ?v11))
:effect (and (pred_12 ?v11) (not (pred_12 ?v9))))

(:action op_2
:parameters (?v9 ?v1)
:precondition (and (pred_2 ?v9) (pred_1 ?v1) 
                  (pred_12 ?v9) (pred_10 ?v1 ?v9) (pred_4 ))
:effect (and (pred_11 ?v1)
   (not (pred_10 ?v1 ?v9)) (not (pred_4 ))))


(:action op_5
:parameters (?v9 ?v8 ?v5)
:precondition (and (pred_2 ?v9) (pred_1 ?v8) (pred_1 ?v5)
                  (pred_12 ?v9) (pred_11 ?v5) (pred_10 ?v8 ?v9))
:effect (and (pred_11 ?v8) (pred_10 ?v5 ?v9)
        (not (pred_11 ?v5)) (not (pred_10 ?v8 ?v9))))

(:action op_3
:parameters (?v9 ?v1)
:precondition (and (pred_2 ?v9) (pred_1 ?v1) 
                  (pred_12 ?v9) (pred_11 ?v1))
:effect (and (pred_4 ) (pred_10 ?v1 ?v9) (not (pred_11 ?v1)))))


	
