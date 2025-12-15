(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v1)
             (pred_5 ?v4 ?v13)
             (pred_1 ?v8 ?v13)
             (pred_11 ?v12 ?v8 )
	     (pred_8 ?v8)
             (pred_6 ?v7)
             (pred_4 ?v4)
             (pred_9 ?v13)
             (pred_3 ?v8)
             (pred_12 ?v4)
             (pred_10 ?v8)
             (pred_7 ))



(:action op_3
:parameters (?v10 ?v9 ?v11 ?v6)
:precondition (and (pred_6 ?v10) (pred_6 ?v9) (pred_4 ?v11) (pred_9 ?v6)
          (pred_2 ?v10 ?v9) (pred_5 ?v11 ?v6)
                   (pred_1 ?v9 ?v6) (pred_8 ?v10) 
                   (pred_3 ?v9) (pred_12 ?v11))
:effect (and  (pred_10 ?v9) (not (pred_3 ?v9))))


(:action op_4
:parameters (?v10 ?v5)
:precondition (and (pred_6 ?v10) (pred_6 ?v5)
               (pred_8 ?v10) (pred_2 ?v10 ?v5) (pred_10 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v10))))

(:action op_5
:parameters (?v10 ?v11)
:precondition (and (pred_6 ?v10) (pred_4 ?v11) 
                  (pred_8 ?v10) (pred_11 ?v11 ?v10) (pred_7 ))
:effect (and (pred_12 ?v11)
   (not (pred_11 ?v11 ?v10)) (not (pred_7 ))))


(:action op_2
:parameters (?v10 ?v2 ?v3)
:precondition (and (pred_6 ?v10) (pred_4 ?v2) (pred_4 ?v3)
                  (pred_8 ?v10) (pred_12 ?v3) (pred_11 ?v2 ?v10))
:effect (and (pred_12 ?v2) (pred_11 ?v3 ?v10)
        (not (pred_12 ?v3)) (not (pred_11 ?v2 ?v10))))

(:action op_1
:parameters (?v10 ?v11)
:precondition (and (pred_6 ?v10) (pred_4 ?v11) 
                  (pred_8 ?v10) (pred_12 ?v11))
:effect (and (pred_7 ) (pred_11 ?v11 ?v10) (not (pred_12 ?v11)))))


	
