(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v7 ?v13)
             (pred_7 ?v6 ?v3)
             (pred_2 ?v7 ?v3)
             (pred_12 ?v8 ?v7 )
	     (pred_8 ?v7)
             (pred_1 ?v2)
             (pred_10 ?v6)
             (pred_5 ?v3)
             (pred_3 ?v7)
             (pred_6 ?v6)
             (pred_9 ?v7)
             (pred_11 ))



(:action op_2
:parameters (?v10 ?v9 ?v4 ?v1)
:precondition (and (pred_1 ?v10) (pred_1 ?v9) (pred_10 ?v4) (pred_5 ?v1)
          (pred_4 ?v10 ?v9) (pred_7 ?v4 ?v1)
                   (pred_2 ?v9 ?v1) (pred_8 ?v10) 
                   (pred_3 ?v9) (pred_6 ?v4))
:effect (and  (pred_9 ?v9) (not (pred_3 ?v9))))


(:action op_1
:parameters (?v10 ?v11)
:precondition (and (pred_1 ?v10) (pred_1 ?v11)
               (pred_8 ?v10) (pred_4 ?v10 ?v11) (pred_9 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v10))))

(:action op_3
:parameters (?v10 ?v4)
:precondition (and (pred_1 ?v10) (pred_10 ?v4) 
                  (pred_8 ?v10) (pred_12 ?v4 ?v10) (pred_11 ))
:effect (and (pred_6 ?v4)
   (not (pred_12 ?v4 ?v10)) (not (pred_11 ))))


(:action op_5
:parameters (?v10 ?v12 ?v5)
:precondition (and (pred_1 ?v10) (pred_10 ?v12) (pred_10 ?v5)
                  (pred_8 ?v10) (pred_6 ?v5) (pred_12 ?v12 ?v10))
:effect (and (pred_6 ?v12) (pred_12 ?v5 ?v10)
        (not (pred_6 ?v5)) (not (pred_12 ?v12 ?v10))))

(:action op_4
:parameters (?v10 ?v4)
:precondition (and (pred_1 ?v10) (pred_10 ?v4) 
                  (pred_8 ?v10) (pred_6 ?v4))
:effect (and (pred_11 ) (pred_12 ?v4 ?v10) (not (pred_6 ?v4)))))


	
