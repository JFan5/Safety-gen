(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v1)
             (pred_10 ?v13 ?v11)
             (pred_4 ?v5 ?v11)
             (pred_1 ?v2 ?v5 )
	     (pred_12 ?v5)
             (pred_7 ?v4)
             (pred_11 ?v13)
             (pred_6 ?v11)
             (pred_5 ?v5)
             (pred_2 ?v13)
             (pred_3 ?v5)
             (pred_8 ))



(:action op_2
:parameters (?v9 ?v10 ?v3 ?v6)
:precondition (and (pred_7 ?v9) (pred_7 ?v10) (pred_11 ?v3) (pred_6 ?v6)
          (pred_9 ?v9 ?v10) (pred_10 ?v3 ?v6)
                   (pred_4 ?v10 ?v6) (pred_12 ?v9) 
                   (pred_5 ?v10) (pred_2 ?v3))
:effect (and  (pred_3 ?v10) (not (pred_5 ?v10))))


(:action op_4
:parameters (?v9 ?v7)
:precondition (and (pred_7 ?v9) (pred_7 ?v7)
               (pred_12 ?v9) (pred_9 ?v9 ?v7) (pred_3 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v9))))

(:action op_1
:parameters (?v9 ?v3)
:precondition (and (pred_7 ?v9) (pred_11 ?v3) 
                  (pred_12 ?v9) (pred_1 ?v3 ?v9) (pred_8 ))
:effect (and (pred_2 ?v3)
   (not (pred_1 ?v3 ?v9)) (not (pred_8 ))))


(:action op_5
:parameters (?v9 ?v12 ?v8)
:precondition (and (pred_7 ?v9) (pred_11 ?v12) (pred_11 ?v8)
                  (pred_12 ?v9) (pred_2 ?v8) (pred_1 ?v12 ?v9))
:effect (and (pred_2 ?v12) (pred_1 ?v8 ?v9)
        (not (pred_2 ?v8)) (not (pred_1 ?v12 ?v9))))

(:action op_3
:parameters (?v9 ?v3)
:precondition (and (pred_7 ?v9) (pred_11 ?v3) 
                  (pred_12 ?v9) (pred_2 ?v3))
:effect (and (pred_8 ) (pred_1 ?v3 ?v9) (not (pred_2 ?v3)))))


	
