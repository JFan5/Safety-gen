(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v13)
             (pred_5 ?v7 ?v5)
             (pred_7 ?v4 ?v5)
             (pred_2 ?v8 ?v4 )
	     (pred_9 ?v4)
             (pred_8 ?v2)
             (pred_11 ?v7)
             (pred_6 ?v5)
             (pred_10 ?v4)
             (pred_4 ?v7)
             (pred_1 ?v4)
             (pred_12 ))



(:action op_3
:parameters (?v12 ?v9 ?v11 ?v3)
:precondition (and (pred_8 ?v12) (pred_8 ?v9) (pred_11 ?v11) (pred_6 ?v3)
          (pred_3 ?v12 ?v9) (pred_5 ?v11 ?v3)
                   (pred_7 ?v9 ?v3) (pred_9 ?v12) 
                   (pred_10 ?v9) (pred_4 ?v11))
:effect (and  (pred_1 ?v9) (not (pred_10 ?v9))))


(:action op_4
:parameters (?v12 ?v10)
:precondition (and (pred_8 ?v12) (pred_8 ?v10)
               (pred_9 ?v12) (pred_3 ?v12 ?v10) (pred_1 ?v10))
:effect (and (pred_9 ?v10) (not (pred_9 ?v12))))

(:action op_1
:parameters (?v12 ?v11)
:precondition (and (pred_8 ?v12) (pred_11 ?v11) 
                  (pred_9 ?v12) (pred_2 ?v11 ?v12) (pred_12 ))
:effect (and (pred_4 ?v11)
   (not (pred_2 ?v11 ?v12)) (not (pred_12 ))))


(:action op_5
:parameters (?v12 ?v1 ?v6)
:precondition (and (pred_8 ?v12) (pred_11 ?v1) (pred_11 ?v6)
                  (pred_9 ?v12) (pred_4 ?v6) (pred_2 ?v1 ?v12))
:effect (and (pred_4 ?v1) (pred_2 ?v6 ?v12)
        (not (pred_4 ?v6)) (not (pred_2 ?v1 ?v12))))

(:action op_2
:parameters (?v12 ?v11)
:precondition (and (pred_8 ?v12) (pred_11 ?v11) 
                  (pred_9 ?v12) (pred_4 ?v11))
:effect (and (pred_12 ) (pred_2 ?v11 ?v12) (not (pred_4 ?v11)))))


	
