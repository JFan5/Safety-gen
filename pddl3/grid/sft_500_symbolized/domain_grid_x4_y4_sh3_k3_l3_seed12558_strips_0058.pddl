(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v13)
             (pred_11 ?v4 ?v6)
             (pred_10 ?v12 ?v6)
             (pred_5 ?v7 ?v12 )
	     (pred_4 ?v12)
             (pred_7 ?v3)
             (pred_12 ?v4)
             (pred_2 ?v6)
             (pred_8 ?v12)
             (pred_6 ?v4)
             (pred_9 ?v12)
             (pred_3 ))



(:action op_3
:parameters (?v9 ?v10 ?v11 ?v2)
:precondition (and (pred_7 ?v9) (pred_7 ?v10) (pred_12 ?v11) (pred_2 ?v2)
          (pred_1 ?v9 ?v10) (pred_11 ?v11 ?v2)
                   (pred_10 ?v10 ?v2) (pred_4 ?v9) 
                   (pred_8 ?v10) (pred_6 ?v11))
:effect (and  (pred_9 ?v10) (not (pred_8 ?v10))))


(:action op_5
:parameters (?v9 ?v8)
:precondition (and (pred_7 ?v9) (pred_7 ?v8)
               (pred_4 ?v9) (pred_1 ?v9 ?v8) (pred_9 ?v8))
:effect (and (pred_4 ?v8) (not (pred_4 ?v9))))

(:action op_1
:parameters (?v9 ?v11)
:precondition (and (pred_7 ?v9) (pred_12 ?v11) 
                  (pred_4 ?v9) (pred_5 ?v11 ?v9) (pred_3 ))
:effect (and (pred_6 ?v11)
   (not (pred_5 ?v11 ?v9)) (not (pred_3 ))))


(:action op_2
:parameters (?v9 ?v5 ?v1)
:precondition (and (pred_7 ?v9) (pred_12 ?v5) (pred_12 ?v1)
                  (pred_4 ?v9) (pred_6 ?v1) (pred_5 ?v5 ?v9))
:effect (and (pred_6 ?v5) (pred_5 ?v1 ?v9)
        (not (pred_6 ?v1)) (not (pred_5 ?v5 ?v9))))

(:action op_4
:parameters (?v9 ?v11)
:precondition (and (pred_7 ?v9) (pred_12 ?v11) 
                  (pred_4 ?v9) (pred_6 ?v11))
:effect (and (pred_3 ) (pred_5 ?v11 ?v9) (not (pred_6 ?v11)))))


	
