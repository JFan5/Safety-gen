(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v12 ?v7)
             (pred_5 ?v13 ?v5)
             (pred_2 ?v12 ?v5)
             (pred_12 ?v8 ?v12 )
	     (pred_10 ?v12)
             (pred_11 ?v10)
             (pred_7 ?v13)
             (pred_9 ?v5)
             (pred_4 ?v12)
             (pred_3 ?v13)
             (pred_1 ?v12)
             (pred_6 ))



(:action op_1
:parameters (?v9 ?v3 ?v11 ?v1)
:precondition (and (pred_11 ?v9) (pred_11 ?v3) (pred_7 ?v11) (pred_9 ?v1)
          (pred_8 ?v9 ?v3) (pred_5 ?v11 ?v1)
                   (pred_2 ?v3 ?v1) (pred_10 ?v9) 
                   (pred_4 ?v3) (pred_3 ?v11))
:effect (and  (pred_1 ?v3) (not (pred_4 ?v3))))


(:action op_5
:parameters (?v9 ?v4)
:precondition (and (pred_11 ?v9) (pred_11 ?v4)
               (pred_10 ?v9) (pred_8 ?v9 ?v4) (pred_1 ?v4))
:effect (and (pred_10 ?v4) (not (pred_10 ?v9))))

(:action op_2
:parameters (?v9 ?v11)
:precondition (and (pred_11 ?v9) (pred_7 ?v11) 
                  (pred_10 ?v9) (pred_12 ?v11 ?v9) (pred_6 ))
:effect (and (pred_3 ?v11)
   (not (pred_12 ?v11 ?v9)) (not (pred_6 ))))


(:action op_4
:parameters (?v9 ?v6 ?v2)
:precondition (and (pred_11 ?v9) (pred_7 ?v6) (pred_7 ?v2)
                  (pred_10 ?v9) (pred_3 ?v2) (pred_12 ?v6 ?v9))
:effect (and (pred_3 ?v6) (pred_12 ?v2 ?v9)
        (not (pred_3 ?v2)) (not (pred_12 ?v6 ?v9))))

(:action op_3
:parameters (?v9 ?v11)
:precondition (and (pred_11 ?v9) (pred_7 ?v11) 
                  (pred_10 ?v9) (pred_3 ?v11))
:effect (and (pred_6 ) (pred_12 ?v11 ?v9) (not (pred_3 ?v11)))))


	
