(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v13 ?v2)
             (pred_1 ?v8 ?v6)
             (pred_3 ?v13 ?v6)
             (pred_12 ?v12 ?v13 )
	     (pred_11 ?v13)
             (pred_2 ?v1)
             (pred_6 ?v8)
             (pred_9 ?v6)
             (pred_7 ?v13)
             (pred_4 ?v8)
             (pred_5 ?v13)
             (pred_10 ))



(:action op_3
:parameters (?v10 ?v9 ?v11 ?v4)
:precondition (and (pred_2 ?v10) (pred_2 ?v9) (pred_6 ?v11) (pred_9 ?v4)
          (pred_8 ?v10 ?v9) (pred_1 ?v11 ?v4)
                   (pred_3 ?v9 ?v4) (pred_11 ?v10) 
                   (pred_7 ?v9) (pred_4 ?v11))
:effect (and  (pred_5 ?v9) (not (pred_7 ?v9))))


(:action op_2
:parameters (?v10 ?v7)
:precondition (and (pred_2 ?v10) (pred_2 ?v7)
               (pred_11 ?v10) (pred_8 ?v10 ?v7) (pred_5 ?v7))
:effect (and (pred_11 ?v7) (not (pred_11 ?v10))))

(:action op_1
:parameters (?v10 ?v11)
:precondition (and (pred_2 ?v10) (pred_6 ?v11) 
                  (pred_11 ?v10) (pred_12 ?v11 ?v10) (pred_10 ))
:effect (and (pred_4 ?v11)
   (not (pred_12 ?v11 ?v10)) (not (pred_10 ))))


(:action op_5
:parameters (?v10 ?v5 ?v3)
:precondition (and (pred_2 ?v10) (pred_6 ?v5) (pred_6 ?v3)
                  (pred_11 ?v10) (pred_4 ?v3) (pred_12 ?v5 ?v10))
:effect (and (pred_4 ?v5) (pred_12 ?v3 ?v10)
        (not (pred_4 ?v3)) (not (pred_12 ?v5 ?v10))))

(:action op_4
:parameters (?v10 ?v11)
:precondition (and (pred_2 ?v10) (pred_6 ?v11) 
                  (pred_11 ?v10) (pred_4 ?v11))
:effect (and (pred_10 ) (pred_12 ?v11 ?v10) (not (pred_4 ?v11)))))


	
